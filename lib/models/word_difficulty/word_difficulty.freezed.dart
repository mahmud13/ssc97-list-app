// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'word_difficulty.dart';

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
