// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'navigation_path.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NavigationPathTearOff {
  const _$NavigationPathTearOff();

  _NavigationPath call(String modelName, String? identifier) {
    return _NavigationPath(
      modelName,
      identifier,
    );
  }
}

/// @nodoc
const $NavigationPath = _$NavigationPathTearOff();

/// @nodoc
mixin _$NavigationPath {
  String get modelName => throw _privateConstructorUsedError;

  String? get identifier => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NavigationPathCopyWith<NavigationPath> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NavigationPathCopyWith<$Res> {
  factory $NavigationPathCopyWith(
          NavigationPath value, $Res Function(NavigationPath) then) =
      _$NavigationPathCopyWithImpl<$Res>;

  $Res call({String modelName, String? identifier});
}

/// @nodoc
class _$NavigationPathCopyWithImpl<$Res>
    implements $NavigationPathCopyWith<$Res> {
  _$NavigationPathCopyWithImpl(this._value, this._then);

  final NavigationPath _value;

  // ignore: unused_field
  final $Res Function(NavigationPath) _then;

  @override
  $Res call({
    Object? modelName = freezed,
    Object? identifier = freezed,
  }) {
    return _then(_value.copyWith(
      modelName: modelName == freezed
          ? _value.modelName
          : modelName // ignore: cast_nullable_to_non_nullable
              as String,
      identifier: identifier == freezed
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$NavigationPathCopyWith<$Res>
    implements $NavigationPathCopyWith<$Res> {
  factory _$NavigationPathCopyWith(
          _NavigationPath value, $Res Function(_NavigationPath) then) =
      __$NavigationPathCopyWithImpl<$Res>;

  @override
  $Res call({String modelName, String? identifier});
}

/// @nodoc
class __$NavigationPathCopyWithImpl<$Res>
    extends _$NavigationPathCopyWithImpl<$Res>
    implements _$NavigationPathCopyWith<$Res> {
  __$NavigationPathCopyWithImpl(
      _NavigationPath _value, $Res Function(_NavigationPath) _then)
      : super(_value, (v) => _then(v as _NavigationPath));

  @override
  _NavigationPath get _value => super._value as _NavigationPath;

  @override
  $Res call({
    Object? modelName = freezed,
    Object? identifier = freezed,
  }) {
    return _then(_NavigationPath(
      modelName == freezed
          ? _value.modelName
          : modelName // ignore: cast_nullable_to_non_nullable
              as String,
      identifier == freezed
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
class _$_NavigationPath extends _NavigationPath {
  const _$_NavigationPath(this.modelName, this.identifier) : super._();

  @override
  final String modelName;
  @override
  final String? identifier;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NavigationPath &&
            (identical(other.modelName, modelName) ||
                const DeepCollectionEquality()
                    .equals(other.modelName, modelName)) &&
            (identical(other.identifier, identifier) ||
                const DeepCollectionEquality()
                    .equals(other.identifier, identifier)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(modelName) ^
      const DeepCollectionEquality().hash(identifier);

  @JsonKey(ignore: true)
  @override
  _$NavigationPathCopyWith<_NavigationPath> get copyWith =>
      __$NavigationPathCopyWithImpl<_NavigationPath>(this, _$identity);
}

abstract class _NavigationPath extends NavigationPath {
  const factory _NavigationPath(String modelName, String? identifier) =
      _$_NavigationPath;

  const _NavigationPath._() : super._();

  @override
  String get modelName => throw _privateConstructorUsedError;

  @override
  String? get identifier => throw _privateConstructorUsedError;

  @override
  @JsonKey(ignore: true)
  _$NavigationPathCopyWith<_NavigationPath> get copyWith =>
      throw _privateConstructorUsedError;
}
