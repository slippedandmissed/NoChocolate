import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:no_chocolate/services/game_data.dart';
import 'package:no_chocolate/services/game_state.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

@RoutePage()
class GamePage extends ConsumerStatefulWidget {
  const GamePage({super.key});

  @override
  ConsumerState<GamePage> createState() => _GamePageState();
}

class _GamePageState extends ConsumerState<GamePage> {
  late final YoutubePlayerController _controller;
  var _position = Duration.zero;
  var _shouldPause = false;
  var _blockingAdvance = false;
  TranscriptSnippet? _lastTranscript;

  @override
  void initState() {
    final gameData = ref.read(gameStateProvider)!;
    final videoId = YoutubePlayer.convertUrlToId(gameData.videoUrl)!;
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        useHybridComposition: false,
      ),
    );
    _controller.addListener(() {
      setState(() {
        _position = _controller.value.position;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final gameData = ref.watch(gameStateProvider)!;

    String? playerName(String word) {
      for (final player in gameData.players) {
        for (final playerWord in player.words) {
          if (playerWord.word == word) {
            return player.name;
          }
        }
      }
      return null;
    }

    TranscriptSnippet? currentTranscript;
    final currentSeconds = _position.inMilliseconds.toDouble() / 1000;
    for (final snippet in gameData.transcript) {
      final end = snippet.start + snippet.dur;
      if (currentSeconds >= snippet.start && currentSeconds <= end) {
        currentTranscript = snippet;
      }
    }

    final wordRegex = RegExp(r"\b(\w+'?\w*)\b");

    final drinkCount = <String, int>{};
    if (_lastTranscript != null &&
        _lastTranscript != currentTranscript &&
        _shouldPause) {
      currentTranscript = _lastTranscript;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          _controller.pause();
          _shouldPause = false;
        });
      });
    }

    if (_blockingAdvance) {
      currentTranscript = _lastTranscript;
    }

    final transcriptWords = currentTranscript == null
        ? <String>[]
        : wordRegex
            .allMatches(currentTranscript.text.toLowerCase())
            .map((match) {
            return match.group(1)!;
          }).toList();

    var found = false;
    for (final word in transcriptWords) {
      final player = playerName(word);
      if (player != null) {
        drinkCount.putIfAbsent(player, () => 0);
        drinkCount[player] = drinkCount[player]! + 1;
        found = true;
      }
    }
    if (found) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          if (!_blockingAdvance) {
            _shouldPause = true;
          }
          _blockingAdvance = true;
        });
      });
    }

    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        setState(() {
          _lastTranscript = currentTranscript;
        });
      },
    );

    return RawKeyboardListener(
      focusNode: FocusNode(),
      autofocus: true,
      onKey: (RawKeyEvent e) {
        if (e.runtimeType.toString() == 'RawKeyDownEvent') {
          if (e.logicalKey.debugName == "Select") {
            setState(() {
              if (_controller.value.isPlaying) {
                _controller.pause();
              } else {
                _blockingAdvance = false;
                _controller.play();
              }
            });
          }
        }
      },
      child: IgnorePointer(
        child: Scaffold(
          body: Center(
            child: Column(
              children: [
                Expanded(
                  child: YoutubePlayer(
                    controller: _controller,
                    showVideoProgressIndicator: false,
                  ),
                ),
                SizedBox(
                  height: 100,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 20,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (final player in gameData.players)
                              PlayerData(player: player),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              for (final word in transcriptWords)
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 2),
                                  child: Text(
                                    word,
                                    style: TextStyle(
                                      color: playerName(word) == null
                                          ? Colors.black
                                          : Colors.red,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                      Positioned(
                        top: 20,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (final entry in drinkCount.entries)
                              DrinkIndicator(
                                player: entry.key,
                                count: entry.value,
                              ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DrinkIndicator extends StatelessWidget {
  final String player;
  final int count;
  const DrinkIndicator({super.key, required this.player, required this.count});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.black)),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          child: Text("$player, take $count drink${count == 1 ? '' : 's'}!"),
        ),
      ),
    );
  }
}

class PlayerData extends StatelessWidget {
  final Player player;
  const PlayerData({super.key, required this.player});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: SizedBox(
        width: 200,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.blue,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Column(
              children: [
                Text(player.name),
                Wrap(
                  runSpacing: 4,
                  spacing: 4,
                  children: [
                    for (final word in player.words) AssignedWord(word: word),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AssignedWord extends StatelessWidget {
  final Word word;
  const AssignedWord({super.key, required this.word});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromARGB(255, 197, 255, 250),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
        child: Text(
          word.word,
          style: const TextStyle(fontSize: 10),
        ),
      ),
    );
  }
}
