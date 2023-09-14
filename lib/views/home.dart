import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localstorage/localstorage.dart';
import 'package:no_chocolate/router/router.dart';
import 'package:no_chocolate/services/game_data.dart';
import 'package:no_chocolate/services/game_state.dart';
import 'package:no_chocolate/services/server/server.dart';
import 'package:qr_flutter/qr_flutter.dart';

@RoutePage()
class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
    ref.read(gameStateProvider.notifier).addListener((state) {
      if (state != null && mounted) {
        context.router.navigate(const GameRoute());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final localStorage = LocalStorage("last-game");
    final lastGameJson =
        localStorage.getItem("last-game") as Map<String, dynamic>?;
    final server = ref.watch(serverProvider);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Scan the QR Code Below to Start a Game!",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20),
            ...server.when(
              data: (server) => [
                Text(server.getUrl()),
                QrImageView(
                  data: server.getUrl(),
                  version: QrVersions.auto,
                  size: 200.0,
                ),
              ],
              error: (error, _) => [Text(error.toString())],
              loading: () => [const CircularProgressIndicator()],
            ),
            if (lastGameJson != null) ...[
              const Text("Or"),
              ElevatedButton(
                onPressed: () {
                  final gameData = GameData.fromJson(lastGameJson);
                  ref.read(gameStateProvider.notifier).setState(gameData);
                },
                child: const Text("Replay the Previous Game"),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
