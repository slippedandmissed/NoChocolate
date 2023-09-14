import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:no_chocolate/services/game_data.dart';

class GameStateNotifier extends StateNotifier<GameData?> {
  GameStateNotifier(super.state);

  void setState(GameData? gameData) {
    state = gameData;
  }
}

final gameStateProvider = StateNotifierProvider<GameStateNotifier, GameData?>(
  (ref) => GameStateNotifier(null),
);
