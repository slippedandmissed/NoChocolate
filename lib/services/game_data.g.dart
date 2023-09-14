// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GameData _$$_GameDataFromJson(Map<String, dynamic> json) => _$_GameData(
      videoUrl: json['videoUrl'] as String,
      transcript: (json['transcript'] as List<dynamic>)
          .map((e) => TranscriptSnippet.fromJson(e as Map<String, dynamic>))
          .toList(),
      players: (json['players'] as List<dynamic>)
          .map((e) => Player.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_GameDataToJson(_$_GameData instance) =>
    <String, dynamic>{
      'videoUrl': instance.videoUrl,
      'transcript': instance.transcript,
      'players': instance.players,
    };

_$_TranscriptSnippet _$$_TranscriptSnippetFromJson(Map<String, dynamic> json) =>
    _$_TranscriptSnippet(
      start: (json['start'] as num).toDouble(),
      dur: (json['dur'] as num).toDouble(),
      text: json['text'] as String,
    );

Map<String, dynamic> _$$_TranscriptSnippetToJson(
        _$_TranscriptSnippet instance) =>
    <String, dynamic>{
      'start': instance.start,
      'dur': instance.dur,
      'text': instance.text,
    };

_$_Player _$$_PlayerFromJson(Map<String, dynamic> json) => _$_Player(
      name: json['name'] as String,
      words: (json['words'] as List<dynamic>)
          .map((e) => Word.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PlayerToJson(_$_Player instance) => <String, dynamic>{
      'name': instance.name,
      'words': instance.words,
    };

_$_Word _$$_WordFromJson(Map<String, dynamic> json) => _$_Word(
      word: json['word'] as String,
      occurances: json['occurances'] as int,
      tfIdf: (json['tfIdf'] as num).toDouble(),
    );

Map<String, dynamic> _$$_WordToJson(_$_Word instance) => <String, dynamic>{
      'word': instance.word,
      'occurances': instance.occurances,
      'tfIdf': instance.tfIdf,
    };
