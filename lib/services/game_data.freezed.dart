// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GameData _$GameDataFromJson(Map<String, dynamic> json) {
  return _GameData.fromJson(json);
}

/// @nodoc
mixin _$GameData {
  String get videoUrl => throw _privateConstructorUsedError;
  List<TranscriptSnippet> get transcript => throw _privateConstructorUsedError;
  List<Player> get players => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameDataCopyWith<GameData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameDataCopyWith<$Res> {
  factory $GameDataCopyWith(GameData value, $Res Function(GameData) then) =
      _$GameDataCopyWithImpl<$Res, GameData>;
  @useResult
  $Res call(
      {String videoUrl,
      List<TranscriptSnippet> transcript,
      List<Player> players});
}

/// @nodoc
class _$GameDataCopyWithImpl<$Res, $Val extends GameData>
    implements $GameDataCopyWith<$Res> {
  _$GameDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videoUrl = null,
    Object? transcript = null,
    Object? players = null,
  }) {
    return _then(_value.copyWith(
      videoUrl: null == videoUrl
          ? _value.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      transcript: null == transcript
          ? _value.transcript
          : transcript // ignore: cast_nullable_to_non_nullable
              as List<TranscriptSnippet>,
      players: null == players
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as List<Player>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GameDataCopyWith<$Res> implements $GameDataCopyWith<$Res> {
  factory _$$_GameDataCopyWith(
          _$_GameData value, $Res Function(_$_GameData) then) =
      __$$_GameDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String videoUrl,
      List<TranscriptSnippet> transcript,
      List<Player> players});
}

/// @nodoc
class __$$_GameDataCopyWithImpl<$Res>
    extends _$GameDataCopyWithImpl<$Res, _$_GameData>
    implements _$$_GameDataCopyWith<$Res> {
  __$$_GameDataCopyWithImpl(
      _$_GameData _value, $Res Function(_$_GameData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videoUrl = null,
    Object? transcript = null,
    Object? players = null,
  }) {
    return _then(_$_GameData(
      videoUrl: null == videoUrl
          ? _value.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      transcript: null == transcript
          ? _value._transcript
          : transcript // ignore: cast_nullable_to_non_nullable
              as List<TranscriptSnippet>,
      players: null == players
          ? _value._players
          : players // ignore: cast_nullable_to_non_nullable
              as List<Player>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GameData implements _GameData {
  const _$_GameData(
      {required this.videoUrl,
      required final List<TranscriptSnippet> transcript,
      required final List<Player> players})
      : _transcript = transcript,
        _players = players;

  factory _$_GameData.fromJson(Map<String, dynamic> json) =>
      _$$_GameDataFromJson(json);

  @override
  final String videoUrl;
  final List<TranscriptSnippet> _transcript;
  @override
  List<TranscriptSnippet> get transcript {
    if (_transcript is EqualUnmodifiableListView) return _transcript;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transcript);
  }

  final List<Player> _players;
  @override
  List<Player> get players {
    if (_players is EqualUnmodifiableListView) return _players;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_players);
  }

  @override
  String toString() {
    return 'GameData(videoUrl: $videoUrl, transcript: $transcript, players: $players)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GameData &&
            (identical(other.videoUrl, videoUrl) ||
                other.videoUrl == videoUrl) &&
            const DeepCollectionEquality()
                .equals(other._transcript, _transcript) &&
            const DeepCollectionEquality().equals(other._players, _players));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      videoUrl,
      const DeepCollectionEquality().hash(_transcript),
      const DeepCollectionEquality().hash(_players));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GameDataCopyWith<_$_GameData> get copyWith =>
      __$$_GameDataCopyWithImpl<_$_GameData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GameDataToJson(
      this,
    );
  }
}

abstract class _GameData implements GameData {
  const factory _GameData(
      {required final String videoUrl,
      required final List<TranscriptSnippet> transcript,
      required final List<Player> players}) = _$_GameData;

  factory _GameData.fromJson(Map<String, dynamic> json) = _$_GameData.fromJson;

  @override
  String get videoUrl;
  @override
  List<TranscriptSnippet> get transcript;
  @override
  List<Player> get players;
  @override
  @JsonKey(ignore: true)
  _$$_GameDataCopyWith<_$_GameData> get copyWith =>
      throw _privateConstructorUsedError;
}

TranscriptSnippet _$TranscriptSnippetFromJson(Map<String, dynamic> json) {
  return _TranscriptSnippet.fromJson(json);
}

/// @nodoc
mixin _$TranscriptSnippet {
  double get start => throw _privateConstructorUsedError;
  double get dur => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TranscriptSnippetCopyWith<TranscriptSnippet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TranscriptSnippetCopyWith<$Res> {
  factory $TranscriptSnippetCopyWith(
          TranscriptSnippet value, $Res Function(TranscriptSnippet) then) =
      _$TranscriptSnippetCopyWithImpl<$Res, TranscriptSnippet>;
  @useResult
  $Res call({double start, double dur, String text});
}

/// @nodoc
class _$TranscriptSnippetCopyWithImpl<$Res, $Val extends TranscriptSnippet>
    implements $TranscriptSnippetCopyWith<$Res> {
  _$TranscriptSnippetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = null,
    Object? dur = null,
    Object? text = null,
  }) {
    return _then(_value.copyWith(
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as double,
      dur: null == dur
          ? _value.dur
          : dur // ignore: cast_nullable_to_non_nullable
              as double,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TranscriptSnippetCopyWith<$Res>
    implements $TranscriptSnippetCopyWith<$Res> {
  factory _$$_TranscriptSnippetCopyWith(_$_TranscriptSnippet value,
          $Res Function(_$_TranscriptSnippet) then) =
      __$$_TranscriptSnippetCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double start, double dur, String text});
}

/// @nodoc
class __$$_TranscriptSnippetCopyWithImpl<$Res>
    extends _$TranscriptSnippetCopyWithImpl<$Res, _$_TranscriptSnippet>
    implements _$$_TranscriptSnippetCopyWith<$Res> {
  __$$_TranscriptSnippetCopyWithImpl(
      _$_TranscriptSnippet _value, $Res Function(_$_TranscriptSnippet) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = null,
    Object? dur = null,
    Object? text = null,
  }) {
    return _then(_$_TranscriptSnippet(
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as double,
      dur: null == dur
          ? _value.dur
          : dur // ignore: cast_nullable_to_non_nullable
              as double,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TranscriptSnippet implements _TranscriptSnippet {
  const _$_TranscriptSnippet(
      {required this.start, required this.dur, required this.text});

  factory _$_TranscriptSnippet.fromJson(Map<String, dynamic> json) =>
      _$$_TranscriptSnippetFromJson(json);

  @override
  final double start;
  @override
  final double dur;
  @override
  final String text;

  @override
  String toString() {
    return 'TranscriptSnippet(start: $start, dur: $dur, text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TranscriptSnippet &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.dur, dur) || other.dur == dur) &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, start, dur, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TranscriptSnippetCopyWith<_$_TranscriptSnippet> get copyWith =>
      __$$_TranscriptSnippetCopyWithImpl<_$_TranscriptSnippet>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TranscriptSnippetToJson(
      this,
    );
  }
}

abstract class _TranscriptSnippet implements TranscriptSnippet {
  const factory _TranscriptSnippet(
      {required final double start,
      required final double dur,
      required final String text}) = _$_TranscriptSnippet;

  factory _TranscriptSnippet.fromJson(Map<String, dynamic> json) =
      _$_TranscriptSnippet.fromJson;

  @override
  double get start;
  @override
  double get dur;
  @override
  String get text;
  @override
  @JsonKey(ignore: true)
  _$$_TranscriptSnippetCopyWith<_$_TranscriptSnippet> get copyWith =>
      throw _privateConstructorUsedError;
}

Player _$PlayerFromJson(Map<String, dynamic> json) {
  return _Player.fromJson(json);
}

/// @nodoc
mixin _$Player {
  String get name => throw _privateConstructorUsedError;
  List<Word> get words => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlayerCopyWith<Player> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerCopyWith<$Res> {
  factory $PlayerCopyWith(Player value, $Res Function(Player) then) =
      _$PlayerCopyWithImpl<$Res, Player>;
  @useResult
  $Res call({String name, List<Word> words});
}

/// @nodoc
class _$PlayerCopyWithImpl<$Res, $Val extends Player>
    implements $PlayerCopyWith<$Res> {
  _$PlayerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? words = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      words: null == words
          ? _value.words
          : words // ignore: cast_nullable_to_non_nullable
              as List<Word>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PlayerCopyWith<$Res> implements $PlayerCopyWith<$Res> {
  factory _$$_PlayerCopyWith(_$_Player value, $Res Function(_$_Player) then) =
      __$$_PlayerCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, List<Word> words});
}

/// @nodoc
class __$$_PlayerCopyWithImpl<$Res>
    extends _$PlayerCopyWithImpl<$Res, _$_Player>
    implements _$$_PlayerCopyWith<$Res> {
  __$$_PlayerCopyWithImpl(_$_Player _value, $Res Function(_$_Player) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? words = null,
  }) {
    return _then(_$_Player(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      words: null == words
          ? _value._words
          : words // ignore: cast_nullable_to_non_nullable
              as List<Word>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Player implements _Player {
  const _$_Player({required this.name, required final List<Word> words})
      : _words = words;

  factory _$_Player.fromJson(Map<String, dynamic> json) =>
      _$$_PlayerFromJson(json);

  @override
  final String name;
  final List<Word> _words;
  @override
  List<Word> get words {
    if (_words is EqualUnmodifiableListView) return _words;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_words);
  }

  @override
  String toString() {
    return 'Player(name: $name, words: $words)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Player &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._words, _words));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, const DeepCollectionEquality().hash(_words));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PlayerCopyWith<_$_Player> get copyWith =>
      __$$_PlayerCopyWithImpl<_$_Player>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PlayerToJson(
      this,
    );
  }
}

abstract class _Player implements Player {
  const factory _Player(
      {required final String name,
      required final List<Word> words}) = _$_Player;

  factory _Player.fromJson(Map<String, dynamic> json) = _$_Player.fromJson;

  @override
  String get name;
  @override
  List<Word> get words;
  @override
  @JsonKey(ignore: true)
  _$$_PlayerCopyWith<_$_Player> get copyWith =>
      throw _privateConstructorUsedError;
}

Word _$WordFromJson(Map<String, dynamic> json) {
  return _Word.fromJson(json);
}

/// @nodoc
mixin _$Word {
  String get word => throw _privateConstructorUsedError;
  int get occurances => throw _privateConstructorUsedError;
  double get tfIdf => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WordCopyWith<Word> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordCopyWith<$Res> {
  factory $WordCopyWith(Word value, $Res Function(Word) then) =
      _$WordCopyWithImpl<$Res, Word>;
  @useResult
  $Res call({String word, int occurances, double tfIdf});
}

/// @nodoc
class _$WordCopyWithImpl<$Res, $Val extends Word>
    implements $WordCopyWith<$Res> {
  _$WordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? word = null,
    Object? occurances = null,
    Object? tfIdf = null,
  }) {
    return _then(_value.copyWith(
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      occurances: null == occurances
          ? _value.occurances
          : occurances // ignore: cast_nullable_to_non_nullable
              as int,
      tfIdf: null == tfIdf
          ? _value.tfIdf
          : tfIdf // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WordCopyWith<$Res> implements $WordCopyWith<$Res> {
  factory _$$_WordCopyWith(_$_Word value, $Res Function(_$_Word) then) =
      __$$_WordCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String word, int occurances, double tfIdf});
}

/// @nodoc
class __$$_WordCopyWithImpl<$Res> extends _$WordCopyWithImpl<$Res, _$_Word>
    implements _$$_WordCopyWith<$Res> {
  __$$_WordCopyWithImpl(_$_Word _value, $Res Function(_$_Word) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? word = null,
    Object? occurances = null,
    Object? tfIdf = null,
  }) {
    return _then(_$_Word(
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      occurances: null == occurances
          ? _value.occurances
          : occurances // ignore: cast_nullable_to_non_nullable
              as int,
      tfIdf: null == tfIdf
          ? _value.tfIdf
          : tfIdf // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Word implements _Word {
  const _$_Word(
      {required this.word, required this.occurances, required this.tfIdf});

  factory _$_Word.fromJson(Map<String, dynamic> json) => _$$_WordFromJson(json);

  @override
  final String word;
  @override
  final int occurances;
  @override
  final double tfIdf;

  @override
  String toString() {
    return 'Word(word: $word, occurances: $occurances, tfIdf: $tfIdf)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Word &&
            (identical(other.word, word) || other.word == word) &&
            (identical(other.occurances, occurances) ||
                other.occurances == occurances) &&
            (identical(other.tfIdf, tfIdf) || other.tfIdf == tfIdf));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, word, occurances, tfIdf);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WordCopyWith<_$_Word> get copyWith =>
      __$$_WordCopyWithImpl<_$_Word>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WordToJson(
      this,
    );
  }
}

abstract class _Word implements Word {
  const factory _Word(
      {required final String word,
      required final int occurances,
      required final double tfIdf}) = _$_Word;

  factory _Word.fromJson(Map<String, dynamic> json) = _$_Word.fromJson;

  @override
  String get word;
  @override
  int get occurances;
  @override
  double get tfIdf;
  @override
  @JsonKey(ignore: true)
  _$$_WordCopyWith<_$_Word> get copyWith => throw _privateConstructorUsedError;
}
