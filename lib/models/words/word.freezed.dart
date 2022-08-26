// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'word.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WordDifficulty _$WordDifficultyFromJson(Map<String, dynamic> json) {
  return _WordDifficulty.fromJson(json);
}

/// @nodoc
mixin _$WordDifficulty {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get sequence => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WordDifficultyCopyWith<WordDifficulty> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordDifficultyCopyWith<$Res> {
  factory $WordDifficultyCopyWith(
          WordDifficulty value, $Res Function(WordDifficulty) then) =
      _$WordDifficultyCopyWithImpl<$Res>;
  $Res call({int id, String name, int sequence});
}

/// @nodoc
class _$WordDifficultyCopyWithImpl<$Res>
    implements $WordDifficultyCopyWith<$Res> {
  _$WordDifficultyCopyWithImpl(this._value, this._then);

  final WordDifficulty _value;
  // ignore: unused_field
  final $Res Function(WordDifficulty) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? sequence = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      sequence: sequence == freezed
          ? _value.sequence
          : sequence // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_WordDifficultyCopyWith<$Res>
    implements $WordDifficultyCopyWith<$Res> {
  factory _$$_WordDifficultyCopyWith(
          _$_WordDifficulty value, $Res Function(_$_WordDifficulty) then) =
      __$$_WordDifficultyCopyWithImpl<$Res>;
  @override
  $Res call({int id, String name, int sequence});
}

/// @nodoc
class __$$_WordDifficultyCopyWithImpl<$Res>
    extends _$WordDifficultyCopyWithImpl<$Res>
    implements _$$_WordDifficultyCopyWith<$Res> {
  __$$_WordDifficultyCopyWithImpl(
      _$_WordDifficulty _value, $Res Function(_$_WordDifficulty) _then)
      : super(_value, (v) => _then(v as _$_WordDifficulty));

  @override
  _$_WordDifficulty get _value => super._value as _$_WordDifficulty;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? sequence = freezed,
  }) {
    return _then(_$_WordDifficulty(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      sequence: sequence == freezed
          ? _value.sequence
          : sequence // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_WordDifficulty extends _WordDifficulty {
  _$_WordDifficulty(
      {required this.id, required this.name, required this.sequence})
      : super._();

  factory _$_WordDifficulty.fromJson(Map<String, dynamic> json) =>
      _$$_WordDifficultyFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final int sequence;

  @override
  String toString() {
    return 'WordDifficulty(id: $id, name: $name, sequence: $sequence)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WordDifficulty &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.sequence, sequence));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(sequence));

  @JsonKey(ignore: true)
  @override
  _$$_WordDifficultyCopyWith<_$_WordDifficulty> get copyWith =>
      __$$_WordDifficultyCopyWithImpl<_$_WordDifficulty>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WordDifficultyToJson(
      this,
    );
  }
}

abstract class _WordDifficulty extends WordDifficulty {
  factory _WordDifficulty(
      {required final int id,
      required final String name,
      required final int sequence}) = _$_WordDifficulty;
  _WordDifficulty._() : super._();

  factory _WordDifficulty.fromJson(Map<String, dynamic> json) =
      _$_WordDifficulty.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  int get sequence;
  @override
  @JsonKey(ignore: true)
  _$$_WordDifficultyCopyWith<_$_WordDifficulty> get copyWith =>
      throw _privateConstructorUsedError;
}

WordCategory _$WordCategoryFromJson(Map<String, dynamic> json) {
  return _WordCategory.fromJson(json);
}

/// @nodoc
mixin _$WordCategory {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get sequence => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WordCategoryCopyWith<WordCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordCategoryCopyWith<$Res> {
  factory $WordCategoryCopyWith(
          WordCategory value, $Res Function(WordCategory) then) =
      _$WordCategoryCopyWithImpl<$Res>;
  $Res call({int id, String name, int sequence});
}

/// @nodoc
class _$WordCategoryCopyWithImpl<$Res> implements $WordCategoryCopyWith<$Res> {
  _$WordCategoryCopyWithImpl(this._value, this._then);

  final WordCategory _value;
  // ignore: unused_field
  final $Res Function(WordCategory) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? sequence = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      sequence: sequence == freezed
          ? _value.sequence
          : sequence // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_WordCategoryCopyWith<$Res>
    implements $WordCategoryCopyWith<$Res> {
  factory _$$_WordCategoryCopyWith(
          _$_WordCategory value, $Res Function(_$_WordCategory) then) =
      __$$_WordCategoryCopyWithImpl<$Res>;
  @override
  $Res call({int id, String name, int sequence});
}

/// @nodoc
class __$$_WordCategoryCopyWithImpl<$Res>
    extends _$WordCategoryCopyWithImpl<$Res>
    implements _$$_WordCategoryCopyWith<$Res> {
  __$$_WordCategoryCopyWithImpl(
      _$_WordCategory _value, $Res Function(_$_WordCategory) _then)
      : super(_value, (v) => _then(v as _$_WordCategory));

  @override
  _$_WordCategory get _value => super._value as _$_WordCategory;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? sequence = freezed,
  }) {
    return _then(_$_WordCategory(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      sequence: sequence == freezed
          ? _value.sequence
          : sequence // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_WordCategory extends _WordCategory {
  _$_WordCategory(
      {required this.id, required this.name, required this.sequence})
      : super._();

  factory _$_WordCategory.fromJson(Map<String, dynamic> json) =>
      _$$_WordCategoryFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final int sequence;

  @override
  String toString() {
    return 'WordCategory(id: $id, name: $name, sequence: $sequence)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WordCategory &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.sequence, sequence));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(sequence));

  @JsonKey(ignore: true)
  @override
  _$$_WordCategoryCopyWith<_$_WordCategory> get copyWith =>
      __$$_WordCategoryCopyWithImpl<_$_WordCategory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WordCategoryToJson(
      this,
    );
  }
}

abstract class _WordCategory extends WordCategory {
  factory _WordCategory(
      {required final int id,
      required final String name,
      required final int sequence}) = _$_WordCategory;
  _WordCategory._() : super._();

  factory _WordCategory.fromJson(Map<String, dynamic> json) =
      _$_WordCategory.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  int get sequence;
  @override
  @JsonKey(ignore: true)
  _$$_WordCategoryCopyWith<_$_WordCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

Word _$WordFromJson(Map<String, dynamic> json) {
  return _Word.fromJson(json);
}

/// @nodoc
mixin _$Word {
  int get id => throw _privateConstructorUsedError;
  String get word => throw _privateConstructorUsedError;
  String get transliteration => throw _privateConstructorUsedError;
  String get audio => throw _privateConstructorUsedError;
  String get picture => throw _privateConstructorUsedError;
  int get sequence => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WordCopyWith<Word> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordCopyWith<$Res> {
  factory $WordCopyWith(Word value, $Res Function(Word) then) =
      _$WordCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String word,
      String transliteration,
      String audio,
      String picture,
      int sequence});
}

/// @nodoc
class _$WordCopyWithImpl<$Res> implements $WordCopyWith<$Res> {
  _$WordCopyWithImpl(this._value, this._then);

  final Word _value;
  // ignore: unused_field
  final $Res Function(Word) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? word = freezed,
    Object? transliteration = freezed,
    Object? audio = freezed,
    Object? picture = freezed,
    Object? sequence = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      word: word == freezed
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      transliteration: transliteration == freezed
          ? _value.transliteration
          : transliteration // ignore: cast_nullable_to_non_nullable
              as String,
      audio: audio == freezed
          ? _value.audio
          : audio // ignore: cast_nullable_to_non_nullable
              as String,
      picture: picture == freezed
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String,
      sequence: sequence == freezed
          ? _value.sequence
          : sequence // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_WordCopyWith<$Res> implements $WordCopyWith<$Res> {
  factory _$$_WordCopyWith(_$_Word value, $Res Function(_$_Word) then) =
      __$$_WordCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String word,
      String transliteration,
      String audio,
      String picture,
      int sequence});
}

/// @nodoc
class __$$_WordCopyWithImpl<$Res> extends _$WordCopyWithImpl<$Res>
    implements _$$_WordCopyWith<$Res> {
  __$$_WordCopyWithImpl(_$_Word _value, $Res Function(_$_Word) _then)
      : super(_value, (v) => _then(v as _$_Word));

  @override
  _$_Word get _value => super._value as _$_Word;

  @override
  $Res call({
    Object? id = freezed,
    Object? word = freezed,
    Object? transliteration = freezed,
    Object? audio = freezed,
    Object? picture = freezed,
    Object? sequence = freezed,
  }) {
    return _then(_$_Word(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      word: word == freezed
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      transliteration: transliteration == freezed
          ? _value.transliteration
          : transliteration // ignore: cast_nullable_to_non_nullable
              as String,
      audio: audio == freezed
          ? _value.audio
          : audio // ignore: cast_nullable_to_non_nullable
              as String,
      picture: picture == freezed
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String,
      sequence: sequence == freezed
          ? _value.sequence
          : sequence // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_Word extends _Word {
  _$_Word(
      {required this.id,
      required this.word,
      required this.transliteration,
      required this.audio,
      required this.picture,
      required this.sequence})
      : super._();

  factory _$_Word.fromJson(Map<String, dynamic> json) => _$$_WordFromJson(json);

  @override
  final int id;
  @override
  final String word;
  @override
  final String transliteration;
  @override
  final String audio;
  @override
  final String picture;
  @override
  final int sequence;

  @override
  String toString() {
    return 'Word(id: $id, word: $word, transliteration: $transliteration, audio: $audio, picture: $picture, sequence: $sequence)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Word &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.word, word) &&
            const DeepCollectionEquality()
                .equals(other.transliteration, transliteration) &&
            const DeepCollectionEquality().equals(other.audio, audio) &&
            const DeepCollectionEquality().equals(other.picture, picture) &&
            const DeepCollectionEquality().equals(other.sequence, sequence));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(word),
      const DeepCollectionEquality().hash(transliteration),
      const DeepCollectionEquality().hash(audio),
      const DeepCollectionEquality().hash(picture),
      const DeepCollectionEquality().hash(sequence));

  @JsonKey(ignore: true)
  @override
  _$$_WordCopyWith<_$_Word> get copyWith =>
      __$$_WordCopyWithImpl<_$_Word>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WordToJson(
      this,
    );
  }
}

abstract class _Word extends Word {
  factory _Word(
      {required final int id,
      required final String word,
      required final String transliteration,
      required final String audio,
      required final String picture,
      required final int sequence}) = _$_Word;
  _Word._() : super._();

  factory _Word.fromJson(Map<String, dynamic> json) = _$_Word.fromJson;

  @override
  int get id;
  @override
  String get word;
  @override
  String get transliteration;
  @override
  String get audio;
  @override
  String get picture;
  @override
  int get sequence;
  @override
  @JsonKey(ignore: true)
  _$$_WordCopyWith<_$_Word> get copyWith => throw _privateConstructorUsedError;
}
