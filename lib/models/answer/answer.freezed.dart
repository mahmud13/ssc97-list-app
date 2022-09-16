// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'answer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LetterAccuracy _$LetterAccuracyFromJson(Map<String, dynamic> json) {
  return _LetterAccuracy.fromJson(json);
}

/// @nodoc
mixin _$LetterAccuracy {
  String get letter => throw _privateConstructorUsedError;
  int get colorCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LetterAccuracyCopyWith<LetterAccuracy> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LetterAccuracyCopyWith<$Res> {
  factory $LetterAccuracyCopyWith(
          LetterAccuracy value, $Res Function(LetterAccuracy) then) =
      _$LetterAccuracyCopyWithImpl<$Res>;
  $Res call({String letter, int colorCode});
}

/// @nodoc
class _$LetterAccuracyCopyWithImpl<$Res>
    implements $LetterAccuracyCopyWith<$Res> {
  _$LetterAccuracyCopyWithImpl(this._value, this._then);

  final LetterAccuracy _value;
  // ignore: unused_field
  final $Res Function(LetterAccuracy) _then;

  @override
  $Res call({
    Object? letter = freezed,
    Object? colorCode = freezed,
  }) {
    return _then(_value.copyWith(
      letter: letter == freezed
          ? _value.letter
          : letter // ignore: cast_nullable_to_non_nullable
              as String,
      colorCode: colorCode == freezed
          ? _value.colorCode
          : colorCode // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_LetterAccuracyCopyWith<$Res>
    implements $LetterAccuracyCopyWith<$Res> {
  factory _$$_LetterAccuracyCopyWith(
          _$_LetterAccuracy value, $Res Function(_$_LetterAccuracy) then) =
      __$$_LetterAccuracyCopyWithImpl<$Res>;
  @override
  $Res call({String letter, int colorCode});
}

/// @nodoc
class __$$_LetterAccuracyCopyWithImpl<$Res>
    extends _$LetterAccuracyCopyWithImpl<$Res>
    implements _$$_LetterAccuracyCopyWith<$Res> {
  __$$_LetterAccuracyCopyWithImpl(
      _$_LetterAccuracy _value, $Res Function(_$_LetterAccuracy) _then)
      : super(_value, (v) => _then(v as _$_LetterAccuracy));

  @override
  _$_LetterAccuracy get _value => super._value as _$_LetterAccuracy;

  @override
  $Res call({
    Object? letter = freezed,
    Object? colorCode = freezed,
  }) {
    return _then(_$_LetterAccuracy(
      letter: letter == freezed
          ? _value.letter
          : letter // ignore: cast_nullable_to_non_nullable
              as String,
      colorCode: colorCode == freezed
          ? _value.colorCode
          : colorCode // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LetterAccuracy extends _LetterAccuracy {
  _$_LetterAccuracy({required this.letter, required this.colorCode})
      : super._();

  factory _$_LetterAccuracy.fromJson(Map<String, dynamic> json) =>
      _$$_LetterAccuracyFromJson(json);

  @override
  final String letter;
  @override
  final int colorCode;

  @override
  String toString() {
    return 'LetterAccuracy(letter: $letter, colorCode: $colorCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LetterAccuracy &&
            const DeepCollectionEquality().equals(other.letter, letter) &&
            const DeepCollectionEquality().equals(other.colorCode, colorCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(letter),
      const DeepCollectionEquality().hash(colorCode));

  @JsonKey(ignore: true)
  @override
  _$$_LetterAccuracyCopyWith<_$_LetterAccuracy> get copyWith =>
      __$$_LetterAccuracyCopyWithImpl<_$_LetterAccuracy>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LetterAccuracyToJson(
      this,
    );
  }
}

abstract class _LetterAccuracy extends LetterAccuracy {
  factory _LetterAccuracy(
      {required final String letter,
      required final int colorCode}) = _$_LetterAccuracy;
  _LetterAccuracy._() : super._();

  factory _LetterAccuracy.fromJson(Map<String, dynamic> json) =
      _$_LetterAccuracy.fromJson;

  @override
  String get letter;
  @override
  int get colorCode;
  @override
  @JsonKey(ignore: true)
  _$$_LetterAccuracyCopyWith<_$_LetterAccuracy> get copyWith =>
      throw _privateConstructorUsedError;
}

WordFeedback _$WordFeedbackFromJson(Map<String, dynamic> json) {
  return _WordFeedback.fromJson(json);
}

/// @nodoc
mixin _$WordFeedback {
  List<LetterAccuracy> get arabic => throw _privateConstructorUsedError;
  List<LetterAccuracy> get transliteration =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WordFeedbackCopyWith<WordFeedback> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordFeedbackCopyWith<$Res> {
  factory $WordFeedbackCopyWith(
          WordFeedback value, $Res Function(WordFeedback) then) =
      _$WordFeedbackCopyWithImpl<$Res>;
  $Res call(
      {List<LetterAccuracy> arabic, List<LetterAccuracy> transliteration});
}

/// @nodoc
class _$WordFeedbackCopyWithImpl<$Res> implements $WordFeedbackCopyWith<$Res> {
  _$WordFeedbackCopyWithImpl(this._value, this._then);

  final WordFeedback _value;
  // ignore: unused_field
  final $Res Function(WordFeedback) _then;

  @override
  $Res call({
    Object? arabic = freezed,
    Object? transliteration = freezed,
  }) {
    return _then(_value.copyWith(
      arabic: arabic == freezed
          ? _value.arabic
          : arabic // ignore: cast_nullable_to_non_nullable
              as List<LetterAccuracy>,
      transliteration: transliteration == freezed
          ? _value.transliteration
          : transliteration // ignore: cast_nullable_to_non_nullable
              as List<LetterAccuracy>,
    ));
  }
}

/// @nodoc
abstract class _$$_WordFeedbackCopyWith<$Res>
    implements $WordFeedbackCopyWith<$Res> {
  factory _$$_WordFeedbackCopyWith(
          _$_WordFeedback value, $Res Function(_$_WordFeedback) then) =
      __$$_WordFeedbackCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<LetterAccuracy> arabic, List<LetterAccuracy> transliteration});
}

/// @nodoc
class __$$_WordFeedbackCopyWithImpl<$Res>
    extends _$WordFeedbackCopyWithImpl<$Res>
    implements _$$_WordFeedbackCopyWith<$Res> {
  __$$_WordFeedbackCopyWithImpl(
      _$_WordFeedback _value, $Res Function(_$_WordFeedback) _then)
      : super(_value, (v) => _then(v as _$_WordFeedback));

  @override
  _$_WordFeedback get _value => super._value as _$_WordFeedback;

  @override
  $Res call({
    Object? arabic = freezed,
    Object? transliteration = freezed,
  }) {
    return _then(_$_WordFeedback(
      arabic: arabic == freezed
          ? _value._arabic
          : arabic // ignore: cast_nullable_to_non_nullable
              as List<LetterAccuracy>,
      transliteration: transliteration == freezed
          ? _value._transliteration
          : transliteration // ignore: cast_nullable_to_non_nullable
              as List<LetterAccuracy>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WordFeedback extends _WordFeedback {
  _$_WordFeedback(
      {required final List<LetterAccuracy> arabic,
      required final List<LetterAccuracy> transliteration})
      : _arabic = arabic,
        _transliteration = transliteration,
        super._();

  factory _$_WordFeedback.fromJson(Map<String, dynamic> json) =>
      _$$_WordFeedbackFromJson(json);

  final List<LetterAccuracy> _arabic;
  @override
  List<LetterAccuracy> get arabic {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_arabic);
  }

  final List<LetterAccuracy> _transliteration;
  @override
  List<LetterAccuracy> get transliteration {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transliteration);
  }

  @override
  String toString() {
    return 'WordFeedback(arabic: $arabic, transliteration: $transliteration)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WordFeedback &&
            const DeepCollectionEquality().equals(other._arabic, _arabic) &&
            const DeepCollectionEquality()
                .equals(other._transliteration, _transliteration));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_arabic),
      const DeepCollectionEquality().hash(_transliteration));

  @JsonKey(ignore: true)
  @override
  _$$_WordFeedbackCopyWith<_$_WordFeedback> get copyWith =>
      __$$_WordFeedbackCopyWithImpl<_$_WordFeedback>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WordFeedbackToJson(
      this,
    );
  }
}

abstract class _WordFeedback extends WordFeedback {
  factory _WordFeedback(
      {required final List<LetterAccuracy> arabic,
      required final List<LetterAccuracy> transliteration}) = _$_WordFeedback;
  _WordFeedback._() : super._();

  factory _WordFeedback.fromJson(Map<String, dynamic> json) =
      _$_WordFeedback.fromJson;

  @override
  List<LetterAccuracy> get arabic;
  @override
  List<LetterAccuracy> get transliteration;
  @override
  @JsonKey(ignore: true)
  _$$_WordFeedbackCopyWith<_$_WordFeedback> get copyWith =>
      throw _privateConstructorUsedError;
}

Answer _$AnswerFromJson(Map<String, dynamic> json) {
  return _Answer.fromJson(json);
}

/// @nodoc
mixin _$Answer {
  int get id => throw _privateConstructorUsedError;
  double get accuracy => throw _privateConstructorUsedError;
  WordFeedback get feedback => throw _privateConstructorUsedError;
  int get wordId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnswerCopyWith<Answer> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnswerCopyWith<$Res> {
  factory $AnswerCopyWith(Answer value, $Res Function(Answer) then) =
      _$AnswerCopyWithImpl<$Res>;
  $Res call({int id, double accuracy, WordFeedback feedback, int wordId});

  $WordFeedbackCopyWith<$Res> get feedback;
}

/// @nodoc
class _$AnswerCopyWithImpl<$Res> implements $AnswerCopyWith<$Res> {
  _$AnswerCopyWithImpl(this._value, this._then);

  final Answer _value;
  // ignore: unused_field
  final $Res Function(Answer) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? accuracy = freezed,
    Object? feedback = freezed,
    Object? wordId = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      accuracy: accuracy == freezed
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as double,
      feedback: feedback == freezed
          ? _value.feedback
          : feedback // ignore: cast_nullable_to_non_nullable
              as WordFeedback,
      wordId: wordId == freezed
          ? _value.wordId
          : wordId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  @override
  $WordFeedbackCopyWith<$Res> get feedback {
    return $WordFeedbackCopyWith<$Res>(_value.feedback, (value) {
      return _then(_value.copyWith(feedback: value));
    });
  }
}

/// @nodoc
abstract class _$$_AnswerCopyWith<$Res> implements $AnswerCopyWith<$Res> {
  factory _$$_AnswerCopyWith(_$_Answer value, $Res Function(_$_Answer) then) =
      __$$_AnswerCopyWithImpl<$Res>;
  @override
  $Res call({int id, double accuracy, WordFeedback feedback, int wordId});

  @override
  $WordFeedbackCopyWith<$Res> get feedback;
}

/// @nodoc
class __$$_AnswerCopyWithImpl<$Res> extends _$AnswerCopyWithImpl<$Res>
    implements _$$_AnswerCopyWith<$Res> {
  __$$_AnswerCopyWithImpl(_$_Answer _value, $Res Function(_$_Answer) _then)
      : super(_value, (v) => _then(v as _$_Answer));

  @override
  _$_Answer get _value => super._value as _$_Answer;

  @override
  $Res call({
    Object? id = freezed,
    Object? accuracy = freezed,
    Object? feedback = freezed,
    Object? wordId = freezed,
  }) {
    return _then(_$_Answer(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      accuracy: accuracy == freezed
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as double,
      feedback: feedback == freezed
          ? _value.feedback
          : feedback // ignore: cast_nullable_to_non_nullable
              as WordFeedback,
      wordId: wordId == freezed
          ? _value.wordId
          : wordId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_Answer extends _Answer {
  _$_Answer(
      {required this.id,
      required this.accuracy,
      required this.feedback,
      required this.wordId})
      : super._();

  factory _$_Answer.fromJson(Map<String, dynamic> json) =>
      _$$_AnswerFromJson(json);

  @override
  final int id;
  @override
  final double accuracy;
  @override
  final WordFeedback feedback;
  @override
  final int wordId;

  @override
  String toString() {
    return 'Answer(id: $id, accuracy: $accuracy, feedback: $feedback, wordId: $wordId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Answer &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.accuracy, accuracy) &&
            const DeepCollectionEquality().equals(other.feedback, feedback) &&
            const DeepCollectionEquality().equals(other.wordId, wordId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(accuracy),
      const DeepCollectionEquality().hash(feedback),
      const DeepCollectionEquality().hash(wordId));

  @JsonKey(ignore: true)
  @override
  _$$_AnswerCopyWith<_$_Answer> get copyWith =>
      __$$_AnswerCopyWithImpl<_$_Answer>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AnswerToJson(
      this,
    );
  }
}

abstract class _Answer extends Answer {
  factory _Answer(
      {required final int id,
      required final double accuracy,
      required final WordFeedback feedback,
      required final int wordId}) = _$_Answer;
  _Answer._() : super._();

  factory _Answer.fromJson(Map<String, dynamic> json) = _$_Answer.fromJson;

  @override
  int get id;
  @override
  double get accuracy;
  @override
  WordFeedback get feedback;
  @override
  int get wordId;
  @override
  @JsonKey(ignore: true)
  _$$_AnswerCopyWith<_$_Answer> get copyWith =>
      throw _privateConstructorUsedError;
}
