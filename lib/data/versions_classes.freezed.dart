// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'versions_classes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AccountData _$AccountDataFromJson(Map<String, dynamic> json) {
  return _AccountData.fromJson(json);
}

/// @nodoc
class _$AccountDataTearOff {
  const _$AccountDataTearOff();

  _AccountData call(
      {required int id,
      required String username,
      required String firstName,
      required String lastName,
      required bool active,
      required List<String> authorities}) {
    return _AccountData(
      id: id,
      username: username,
      firstName: firstName,
      lastName: lastName,
      active: active,
      authorities: authorities,
    );
  }

  AccountData fromJson(Map<String, Object> json) {
    return AccountData.fromJson(json);
  }
}

/// @nodoc
const $AccountData = _$AccountDataTearOff();

/// @nodoc
mixin _$AccountData {
  int get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;
  List<String> get authorities => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountDataCopyWith<AccountData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountDataCopyWith<$Res> {
  factory $AccountDataCopyWith(
          AccountData value, $Res Function(AccountData) then) =
      _$AccountDataCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String username,
      String firstName,
      String lastName,
      bool active,
      List<String> authorities});
}

/// @nodoc
class _$AccountDataCopyWithImpl<$Res> implements $AccountDataCopyWith<$Res> {
  _$AccountDataCopyWithImpl(this._value, this._then);

  final AccountData _value;
  // ignore: unused_field
  final $Res Function(AccountData) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? active = freezed,
    Object? authorities = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      active: active == freezed
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      authorities: authorities == freezed
          ? _value.authorities
          : authorities // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$AccountDataCopyWith<$Res>
    implements $AccountDataCopyWith<$Res> {
  factory _$AccountDataCopyWith(
          _AccountData value, $Res Function(_AccountData) then) =
      __$AccountDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String username,
      String firstName,
      String lastName,
      bool active,
      List<String> authorities});
}

/// @nodoc
class __$AccountDataCopyWithImpl<$Res> extends _$AccountDataCopyWithImpl<$Res>
    implements _$AccountDataCopyWith<$Res> {
  __$AccountDataCopyWithImpl(
      _AccountData _value, $Res Function(_AccountData) _then)
      : super(_value, (v) => _then(v as _AccountData));

  @override
  _AccountData get _value => super._value as _AccountData;

  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? active = freezed,
    Object? authorities = freezed,
  }) {
    return _then(_AccountData(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      active: active == freezed
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      authorities: authorities == freezed
          ? _value.authorities
          : authorities // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_AccountData with DiagnosticableTreeMixin implements _AccountData {
  _$_AccountData(
      {required this.id,
      required this.username,
      required this.firstName,
      required this.lastName,
      required this.active,
      required this.authorities});

  factory _$_AccountData.fromJson(Map<String, dynamic> json) =>
      _$_$_AccountDataFromJson(json);

  @override
  final int id;
  @override
  final String username;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final bool active;
  @override
  final List<String> authorities;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AccountData(id: $id, username: $username, firstName: $firstName, lastName: $lastName, active: $active, authorities: $authorities)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AccountData'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('username', username))
      ..add(DiagnosticsProperty('firstName', firstName))
      ..add(DiagnosticsProperty('lastName', lastName))
      ..add(DiagnosticsProperty('active', active))
      ..add(DiagnosticsProperty('authorities', authorities));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AccountData &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)) &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.active, active) ||
                const DeepCollectionEquality().equals(other.active, active)) &&
            (identical(other.authorities, authorities) ||
                const DeepCollectionEquality()
                    .equals(other.authorities, authorities)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(active) ^
      const DeepCollectionEquality().hash(authorities);

  @JsonKey(ignore: true)
  @override
  _$AccountDataCopyWith<_AccountData> get copyWith =>
      __$AccountDataCopyWithImpl<_AccountData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AccountDataToJson(this);
  }
}

abstract class _AccountData implements AccountData {
  factory _AccountData(
      {required int id,
      required String username,
      required String firstName,
      required String lastName,
      required bool active,
      required List<String> authorities}) = _$_AccountData;

  factory _AccountData.fromJson(Map<String, dynamic> json) =
      _$_AccountData.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  String get username => throw _privateConstructorUsedError;
  @override
  String get firstName => throw _privateConstructorUsedError;
  @override
  String get lastName => throw _privateConstructorUsedError;
  @override
  bool get active => throw _privateConstructorUsedError;
  @override
  List<String> get authorities => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AccountDataCopyWith<_AccountData> get copyWith =>
      throw _privateConstructorUsedError;
}
