import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_data.freezed.dart';
part 'game_data.g.dart';

@freezed
class GameData with _$GameData {
  const factory GameData({
    required String videoUrl,
    required List<TranscriptSnippet> transcript,
    required List<Player> players,
  }) = _GameData;

  factory GameData.fromJson(Map<String, Object?> json) =>
      _$GameDataFromJson(json);
}

@freezed
class TranscriptSnippet with _$TranscriptSnippet {
  const factory TranscriptSnippet({
    required double start,
    required double dur,
    required String text,
  }) = _TranscriptSnippet;

  factory TranscriptSnippet.fromJson(Map<String, Object?> json) =>
      _$TranscriptSnippetFromJson(json);
}

@freezed
class Player with _$Player {
  const factory Player({
    required String name,
    required List<Word> words,
  }) = _Player;

  factory Player.fromJson(Map<String, Object?> json) => _$PlayerFromJson(json);
}

@freezed
class Word with _$Word {
  const factory Word({
    required String word,
    required int occurances,
    required double tfIdf,
  }) = _Word;

  factory Word.fromJson(Map<String, Object?> json) => _$WordFromJson(json);
}
