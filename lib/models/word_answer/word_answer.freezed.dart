// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'word_answer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WordAnswer _$WordAnswerFromJson(Map<String, dynamic> json) {
  return _WordAnswer.fromJson(json);
}

/// @nodoc
mixin _$WordAnswer {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get sequence => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WordAnswerCopyWith<WordAnswer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordAnswerCopyWith<$Res> {
  factory $WordAnswerCopyWith(
          WordAnswer value, $Res Function(WordAnswer) then) =
      _$WordAnswerCopyWithImpl<$Res>;
  $Res call({int id, String name, int sequence});
}

/// @nodoc
class _$WordAnswerCopyWithImpl<$Res> implements $WordAnswerCopyWith<$Res> {
  _$WordAnswerCopyWithImpl(this._value, this._then);

  final WordAnswer _value;
  // ignore: unused_field
  final $Res Function(WordAnswer) _then;

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
abstract class _$$_WordAnswerCopyWith<$Res>
    implements $WordAnswerCopyWith<$Res> {
  factory _$$_WordAnswerCopyWith(
          _$_WordAnswer value, $Res Function(_$_WordAnswer) then) =
      __$$_WordAnswerCopyWithImpl<$Res>;
  @override
  $Res call({int id, String name, int sequence});
}

/// @nodoc
class __$$_WordAnswerCopyWithImpl<$Res> extends _$WordAnswerCopyWithImpl<$Res>
    implements _$$_WordAnswerCopyWith<$Res> {
  __$$_WordAnswerCopyWithImpl(
      _$_WordAnswer _value, $Res Function(_$_WordAnswer) _then)
      : super(_value, (v) => _then(v as _$_WordAnswer));

  @override
  _$_WordAnswer get _value => super._value as _$_WordAnswer;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? sequence = freezed,
  }) {
    return _then(_$_WordAnswer(
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
class _$_WordAnswer extends _WordAnswer {
  _$_WordAnswer({required this.id, required this.name, required this.sequence})
      : super._();

  factory _$_WordAnswer.fromJson(Map<String, dynamic> json) =>
      _$$_WordAnswerFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final int sequence;

  @override
  String toString() {
    return 'WordAnswer(id: $id, name: $name, sequence: $sequence)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WordAnswer &&
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
  _$$_WordAnswerCopyWith<_$_WordAnswer> get copyWith =>
      __$$_WordAnswerCopyWithImpl<_$_WordAnswer>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WordAnswerToJson(
      this,
    );
  }
}

abstract class _WordAnswer extends WordAnswer {
  factory _WordAnswer(
      {required final int id,
      required final String name,
      required final int sequence}) = _$_WordAnswer;
  _WordAnswer._() : super._();

  factory _WordAnswer.fromJson(Map<String, dynamic> json) =
      _$_WordAnswer.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  int get sequence;
  @override
  @JsonKey(ignore: true)
  _$$_WordAnswerCopyWith<_$_WordAnswer> get copyWith =>
      throw _privateConstructorUsedError;
}
