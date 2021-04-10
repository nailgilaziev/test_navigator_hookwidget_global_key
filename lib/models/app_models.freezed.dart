// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'app_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AppConditionTearOff {
  const _$AppConditionTearOff();

  _AppCondition call(
      {required bool bootstrapped,
      required bool authorized,
      required LayoutMode layoutMode}) {
    return _AppCondition(
      bootstrapped: bootstrapped,
      authorized: authorized,
      layoutMode: layoutMode,
    );
  }
}

/// @nodoc
const $AppCondition = _$AppConditionTearOff();

/// @nodoc
mixin _$AppCondition {
  bool get bootstrapped => throw _privateConstructorUsedError;
  bool get authorized => throw _privateConstructorUsedError;
  LayoutMode get layoutMode => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppConditionCopyWith<AppCondition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppConditionCopyWith<$Res> {
  factory $AppConditionCopyWith(
          AppCondition value, $Res Function(AppCondition) then) =
      _$AppConditionCopyWithImpl<$Res>;
  $Res call({bool bootstrapped, bool authorized, LayoutMode layoutMode});
}

/// @nodoc
class _$AppConditionCopyWithImpl<$Res> implements $AppConditionCopyWith<$Res> {
  _$AppConditionCopyWithImpl(this._value, this._then);

  final AppCondition _value;
  // ignore: unused_field
  final $Res Function(AppCondition) _then;

  @override
  $Res call({
    Object? bootstrapped = freezed,
    Object? authorized = freezed,
    Object? layoutMode = freezed,
  }) {
    return _then(_value.copyWith(
      bootstrapped: bootstrapped == freezed
          ? _value.bootstrapped
          : bootstrapped // ignore: cast_nullable_to_non_nullable
              as bool,
      authorized: authorized == freezed
          ? _value.authorized
          : authorized // ignore: cast_nullable_to_non_nullable
              as bool,
      layoutMode: layoutMode == freezed
          ? _value.layoutMode
          : layoutMode // ignore: cast_nullable_to_non_nullable
              as LayoutMode,
    ));
  }
}

/// @nodoc
abstract class _$AppConditionCopyWith<$Res>
    implements $AppConditionCopyWith<$Res> {
  factory _$AppConditionCopyWith(
          _AppCondition value, $Res Function(_AppCondition) then) =
      __$AppConditionCopyWithImpl<$Res>;
  @override
  $Res call({bool bootstrapped, bool authorized, LayoutMode layoutMode});
}

/// @nodoc
class __$AppConditionCopyWithImpl<$Res> extends _$AppConditionCopyWithImpl<$Res>
    implements _$AppConditionCopyWith<$Res> {
  __$AppConditionCopyWithImpl(
      _AppCondition _value, $Res Function(_AppCondition) _then)
      : super(_value, (v) => _then(v as _AppCondition));

  @override
  _AppCondition get _value => super._value as _AppCondition;

  @override
  $Res call({
    Object? bootstrapped = freezed,
    Object? authorized = freezed,
    Object? layoutMode = freezed,
  }) {
    return _then(_AppCondition(
      bootstrapped: bootstrapped == freezed
          ? _value.bootstrapped
          : bootstrapped // ignore: cast_nullable_to_non_nullable
              as bool,
      authorized: authorized == freezed
          ? _value.authorized
          : authorized // ignore: cast_nullable_to_non_nullable
              as bool,
      layoutMode: layoutMode == freezed
          ? _value.layoutMode
          : layoutMode // ignore: cast_nullable_to_non_nullable
              as LayoutMode,
    ));
  }
}

/// @nodoc
class _$_AppCondition implements _AppCondition {
  const _$_AppCondition(
      {required this.bootstrapped,
      required this.authorized,
      required this.layoutMode});

  @override
  final bool bootstrapped;
  @override
  final bool authorized;
  @override
  final LayoutMode layoutMode;

  @override
  String toString() {
    return 'AppCondition(bootstrapped: $bootstrapped, authorized: $authorized, layoutMode: $layoutMode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AppCondition &&
            (identical(other.bootstrapped, bootstrapped) ||
                const DeepCollectionEquality()
                    .equals(other.bootstrapped, bootstrapped)) &&
            (identical(other.authorized, authorized) ||
                const DeepCollectionEquality()
                    .equals(other.authorized, authorized)) &&
            (identical(other.layoutMode, layoutMode) ||
                const DeepCollectionEquality()
                    .equals(other.layoutMode, layoutMode)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(bootstrapped) ^
      const DeepCollectionEquality().hash(authorized) ^
      const DeepCollectionEquality().hash(layoutMode);

  @JsonKey(ignore: true)
  @override
  _$AppConditionCopyWith<_AppCondition> get copyWith =>
      __$AppConditionCopyWithImpl<_AppCondition>(this, _$identity);
}

abstract class _AppCondition implements AppCondition {
  const factory _AppCondition(
      {required bool bootstrapped,
      required bool authorized,
      required LayoutMode layoutMode}) = _$_AppCondition;

  @override
  bool get bootstrapped => throw _privateConstructorUsedError;
  @override
  bool get authorized => throw _privateConstructorUsedError;
  @override
  LayoutMode get layoutMode => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AppConditionCopyWith<_AppCondition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$DetailsModeTearOff {
  const _$DetailsModeTearOff();

  _NothingMode nothing() {
    return _NothingMode();
  }

  _UnparsableMode unparsable() {
    return _UnparsableMode();
  }

  _ItemMode item({int? id, bool editing = false}) {
    return _ItemMode(
      id: id,
      editing: editing,
    );
  }
}

/// @nodoc
const $DetailsMode = _$DetailsModeTearOff();

/// @nodoc
mixin _$DetailsMode {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() nothing,
    required TResult Function() unparsable,
    required TResult Function(int? id, bool editing) item,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? nothing,
    TResult Function()? unparsable,
    TResult Function(int? id, bool editing)? item,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NothingMode value) nothing,
    required TResult Function(_UnparsableMode value) unparsable,
    required TResult Function(_ItemMode value) item,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NothingMode value)? nothing,
    TResult Function(_UnparsableMode value)? unparsable,
    TResult Function(_ItemMode value)? item,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailsModeCopyWith<$Res> {
  factory $DetailsModeCopyWith(
          DetailsMode value, $Res Function(DetailsMode) then) =
      _$DetailsModeCopyWithImpl<$Res>;
}

/// @nodoc
class _$DetailsModeCopyWithImpl<$Res> implements $DetailsModeCopyWith<$Res> {
  _$DetailsModeCopyWithImpl(this._value, this._then);

  final DetailsMode _value;
  // ignore: unused_field
  final $Res Function(DetailsMode) _then;
}

/// @nodoc
abstract class _$NothingModeCopyWith<$Res> {
  factory _$NothingModeCopyWith(
          _NothingMode value, $Res Function(_NothingMode) then) =
      __$NothingModeCopyWithImpl<$Res>;
}

/// @nodoc
class __$NothingModeCopyWithImpl<$Res> extends _$DetailsModeCopyWithImpl<$Res>
    implements _$NothingModeCopyWith<$Res> {
  __$NothingModeCopyWithImpl(
      _NothingMode _value, $Res Function(_NothingMode) _then)
      : super(_value, (v) => _then(v as _NothingMode));

  @override
  _NothingMode get _value => super._value as _NothingMode;
}

/// @nodoc
class _$_NothingMode implements _NothingMode {
  _$_NothingMode();

  @override
  String toString() {
    return 'DetailsMode.nothing()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _NothingMode);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() nothing,
    required TResult Function() unparsable,
    required TResult Function(int? id, bool editing) item,
  }) {
    return nothing();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? nothing,
    TResult Function()? unparsable,
    TResult Function(int? id, bool editing)? item,
    required TResult orElse(),
  }) {
    if (nothing != null) {
      return nothing();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NothingMode value) nothing,
    required TResult Function(_UnparsableMode value) unparsable,
    required TResult Function(_ItemMode value) item,
  }) {
    return nothing(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NothingMode value)? nothing,
    TResult Function(_UnparsableMode value)? unparsable,
    TResult Function(_ItemMode value)? item,
    required TResult orElse(),
  }) {
    if (nothing != null) {
      return nothing(this);
    }
    return orElse();
  }
}

abstract class _NothingMode implements DetailsMode {
  factory _NothingMode() = _$_NothingMode;
}

/// @nodoc
abstract class _$UnparsableModeCopyWith<$Res> {
  factory _$UnparsableModeCopyWith(
          _UnparsableMode value, $Res Function(_UnparsableMode) then) =
      __$UnparsableModeCopyWithImpl<$Res>;
}

/// @nodoc
class __$UnparsableModeCopyWithImpl<$Res>
    extends _$DetailsModeCopyWithImpl<$Res>
    implements _$UnparsableModeCopyWith<$Res> {
  __$UnparsableModeCopyWithImpl(
      _UnparsableMode _value, $Res Function(_UnparsableMode) _then)
      : super(_value, (v) => _then(v as _UnparsableMode));

  @override
  _UnparsableMode get _value => super._value as _UnparsableMode;
}

/// @nodoc
class _$_UnparsableMode implements _UnparsableMode {
  _$_UnparsableMode();

  @override
  String toString() {
    return 'DetailsMode.unparsable()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _UnparsableMode);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() nothing,
    required TResult Function() unparsable,
    required TResult Function(int? id, bool editing) item,
  }) {
    return unparsable();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? nothing,
    TResult Function()? unparsable,
    TResult Function(int? id, bool editing)? item,
    required TResult orElse(),
  }) {
    if (unparsable != null) {
      return unparsable();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NothingMode value) nothing,
    required TResult Function(_UnparsableMode value) unparsable,
    required TResult Function(_ItemMode value) item,
  }) {
    return unparsable(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NothingMode value)? nothing,
    TResult Function(_UnparsableMode value)? unparsable,
    TResult Function(_ItemMode value)? item,
    required TResult orElse(),
  }) {
    if (unparsable != null) {
      return unparsable(this);
    }
    return orElse();
  }
}

abstract class _UnparsableMode implements DetailsMode {
  factory _UnparsableMode() = _$_UnparsableMode;
}

/// @nodoc
abstract class _$ItemModeCopyWith<$Res> {
  factory _$ItemModeCopyWith(_ItemMode value, $Res Function(_ItemMode) then) =
      __$ItemModeCopyWithImpl<$Res>;
  $Res call({int? id, bool editing});
}

/// @nodoc
class __$ItemModeCopyWithImpl<$Res> extends _$DetailsModeCopyWithImpl<$Res>
    implements _$ItemModeCopyWith<$Res> {
  __$ItemModeCopyWithImpl(_ItemMode _value, $Res Function(_ItemMode) _then)
      : super(_value, (v) => _then(v as _ItemMode));

  @override
  _ItemMode get _value => super._value as _ItemMode;

  @override
  $Res call({
    Object? id = freezed,
    Object? editing = freezed,
  }) {
    return _then(_ItemMode(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      editing: editing == freezed
          ? _value.editing
          : editing // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
class _$_ItemMode implements _ItemMode {
  _$_ItemMode({this.id, this.editing = false});

  @override
  final int? id;
  @JsonKey(defaultValue: false)
  @override
  final bool editing;

  @override
  String toString() {
    return 'DetailsMode.item(id: $id, editing: $editing)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ItemMode &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.editing, editing) ||
                const DeepCollectionEquality().equals(other.editing, editing)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(editing);

  @JsonKey(ignore: true)
  @override
  _$ItemModeCopyWith<_ItemMode> get copyWith =>
      __$ItemModeCopyWithImpl<_ItemMode>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() nothing,
    required TResult Function() unparsable,
    required TResult Function(int? id, bool editing) item,
  }) {
    return item(id, editing);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? nothing,
    TResult Function()? unparsable,
    TResult Function(int? id, bool editing)? item,
    required TResult orElse(),
  }) {
    if (item != null) {
      return item(id, editing);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NothingMode value) nothing,
    required TResult Function(_UnparsableMode value) unparsable,
    required TResult Function(_ItemMode value) item,
  }) {
    return item(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NothingMode value)? nothing,
    TResult Function(_UnparsableMode value)? unparsable,
    TResult Function(_ItemMode value)? item,
    required TResult orElse(),
  }) {
    if (item != null) {
      return item(this);
    }
    return orElse();
  }
}

abstract class _ItemMode implements DetailsMode {
  factory _ItemMode({int? id, bool editing}) = _$_ItemMode;

  int? get id => throw _privateConstructorUsedError;
  bool get editing => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$ItemModeCopyWith<_ItemMode> get copyWith =>
      throw _privateConstructorUsedError;
}
