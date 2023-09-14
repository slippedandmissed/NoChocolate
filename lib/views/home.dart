import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:no_chocolate/services/server/server.dart';
import 'package:qr_flutter/qr_flutter.dart';

@RoutePage()
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            )
          ],
        ),
      ),
    );
  }
}
