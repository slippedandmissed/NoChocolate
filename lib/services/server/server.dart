import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:no_chocolate/services/game_data.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_router/shelf_router.dart' as shelf_router;
import 'package:shelf_static/shelf_static.dart' as shelf_static;
import 'package:network_info_plus/network_info_plus.dart';
import 'package:path/path.dart' as p;
import 'package:http/http.dart' as http;

class Server {
  late final shelf_router.Router _router;
  late final FutureOr<Response> Function(Request) _staticHandler;

  late final HttpServer _httpServer;
  late final String _ipAddress;

  Future<List<String>> _copyAssetsToDocuments() async {
    // Get the app documents directory.
    final directory = await getApplicationDocumentsDirectory();

    // Get a handle to the asset bundle.
    final bundle = rootBundle;

    // Get a list of all assets in the 'assets' folder.
    final assets = await bundle.loadString('AssetManifest.json');
    var assetList = jsonDecode(assets) as Map<String, dynamic>;

    // removed unwanted assets
    assetList.removeWhere((key, value) => !key.startsWith('public'));

    // print all asset that will be copied
    for (final assetPath in assetList.keys) {
      debugPrint(assetPath);
    }

    List<String> copiedAssets = [];

    // Copy each asset to the app documents directory.
    for (final assetPath in assetList.keys) {
      final assetData = await bundle.load(assetPath);
      final file = File('${directory.path}/$assetPath');
      await file.create(recursive: true);
      await file.writeAsBytes(assetData.buffer.asUint8List());

      // record
      copiedAssets.add(assetPath);
    }

    return copiedAssets;
  }

  Future<void> init() async {
    await _copyAssetsToDocuments();

    _staticHandler = shelf_static.createStaticHandler(
        p.join((await getApplicationDocumentsDirectory()).path, "public"),
        defaultDocument: 'index.html');
    _router = shelf_router.Router()
      ..get('/heart', _heartHandler)
      ..get("/proxy", _proxyHandler)
      ..post("/start-game", _startGameHandler);

    final cascade = Cascade().add(_staticHandler).add(_router);

    final handler = const Pipeline()
        .addMiddleware(logRequests())
        .addHandler(cascade.handler);

    _httpServer = await shelf_io.serve(
      handler,
      '0.0.0.0',
      8080,
    );

    _httpServer.autoCompress = true;

    final info = NetworkInfo();
    _ipAddress = (await info.getWifiIP())!;

    debugPrint('Serving at ${getUrl()}');
  }

  Response _heartHandler(Request request) {
    return Response.ok("beat");
  }

  Future<Response> _proxyHandler(Request request) async {
    final url = request.requestedUri.queryParameters["url"];
    if (url == null) {
      return Response.badRequest();
    }
    final response = await http.get(Uri.parse(url));
    return Response.ok(response.body);
  }

  Future<Response> _startGameHandler(Request request) async {
    final bodyString = await request.readAsString();
    final bodyJson = json.decode(bodyString);
    final gameData = GameData.fromJson(bodyJson);
    return Response.ok("Ok");
  }

  String getUrl() {
    return "http://${_ipAddress}:${_httpServer.port}";
  }
}

final serverProvider = FutureProvider((ref) async {
  final server = Server();
  await server.init();
  return server;
});
