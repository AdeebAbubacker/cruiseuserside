// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_cruiseon_location_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ListCruiseonLocationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String location) getCruise,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String location)? getCruise,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String location)? getCruise,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetCruise value) getCruise,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetCruise value)? getCruise,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetCruise value)? getCruise,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListCruiseonLocationEventCopyWith<$Res> {
  factory $ListCruiseonLocationEventCopyWith(ListCruiseonLocationEvent value,
          $Res Function(ListCruiseonLocationEvent) then) =
      _$ListCruiseonLocationEventCopyWithImpl<$Res, ListCruiseonLocationEvent>;
}

/// @nodoc
class _$ListCruiseonLocationEventCopyWithImpl<$Res,
        $Val extends ListCruiseonLocationEvent>
    implements $ListCruiseonLocationEventCopyWith<$Res> {
  _$ListCruiseonLocationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ListCruiseonLocationEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$ListCruiseonLocationEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ListCruiseonLocationEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'ListCruiseonLocationEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String location) getCruise,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String location)? getCruise,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String location)? getCruise,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetCruise value) getCruise,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetCruise value)? getCruise,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetCruise value)? getCruise,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements ListCruiseonLocationEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$GetCruiseImplCopyWith<$Res> {
  factory _$$GetCruiseImplCopyWith(
          _$GetCruiseImpl value, $Res Function(_$GetCruiseImpl) then) =
      __$$GetCruiseImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String location});
}

/// @nodoc
class __$$GetCruiseImplCopyWithImpl<$Res>
    extends _$ListCruiseonLocationEventCopyWithImpl<$Res, _$GetCruiseImpl>
    implements _$$GetCruiseImplCopyWith<$Res> {
  __$$GetCruiseImplCopyWithImpl(
      _$GetCruiseImpl _value, $Res Function(_$GetCruiseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ListCruiseonLocationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location = null,
  }) {
    return _then(_$GetCruiseImpl(
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetCruiseImpl implements _GetCruise {
  const _$GetCruiseImpl({required this.location});

  @override
  final String location;

  @override
  String toString() {
    return 'ListCruiseonLocationEvent.getCruise(location: $location)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetCruiseImpl &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @override
  int get hashCode => Object.hash(runtimeType, location);

  /// Create a copy of ListCruiseonLocationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetCruiseImplCopyWith<_$GetCruiseImpl> get copyWith =>
      __$$GetCruiseImplCopyWithImpl<_$GetCruiseImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String location) getCruise,
  }) {
    return getCruise(location);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String location)? getCruise,
  }) {
    return getCruise?.call(location);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String location)? getCruise,
    required TResult orElse(),
  }) {
    if (getCruise != null) {
      return getCruise(location);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetCruise value) getCruise,
  }) {
    return getCruise(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetCruise value)? getCruise,
  }) {
    return getCruise?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetCruise value)? getCruise,
    required TResult orElse(),
  }) {
    if (getCruise != null) {
      return getCruise(this);
    }
    return orElse();
  }
}

abstract class _GetCruise implements ListCruiseonLocationEvent {
  const factory _GetCruise({required final String location}) = _$GetCruiseImpl;

  String get location;

  /// Create a copy of ListCruiseonLocationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetCruiseImplCopyWith<_$GetCruiseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ListCruiseonLocationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(CruiseModel cruisemodel) getcruiseuccess,
    required TResult Function(String error) getcruiseFailure,
    required TResult Function() noInternet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(CruiseModel cruisemodel)? getcruiseuccess,
    TResult? Function(String error)? getcruiseFailure,
    TResult? Function()? noInternet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CruiseModel cruisemodel)? getcruiseuccess,
    TResult Function(String error)? getcruiseFailure,
    TResult Function()? noInternet,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Getcruiseuccess value) getcruiseuccess,
    required TResult Function(GetcruiseFailure value) getcruiseFailure,
    required TResult Function(_NoInternet value) noInternet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Getcruiseuccess value)? getcruiseuccess,
    TResult? Function(GetcruiseFailure value)? getcruiseFailure,
    TResult? Function(_NoInternet value)? noInternet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Getcruiseuccess value)? getcruiseuccess,
    TResult Function(GetcruiseFailure value)? getcruiseFailure,
    TResult Function(_NoInternet value)? noInternet,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListCruiseonLocationStateCopyWith<$Res> {
  factory $ListCruiseonLocationStateCopyWith(ListCruiseonLocationState value,
          $Res Function(ListCruiseonLocationState) then) =
      _$ListCruiseonLocationStateCopyWithImpl<$Res, ListCruiseonLocationState>;
}

/// @nodoc
class _$ListCruiseonLocationStateCopyWithImpl<$Res,
        $Val extends ListCruiseonLocationState>
    implements $ListCruiseonLocationStateCopyWith<$Res> {
  _$ListCruiseonLocationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ListCruiseonLocationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ListCruiseonLocationStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of ListCruiseonLocationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'ListCruiseonLocationState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(CruiseModel cruisemodel) getcruiseuccess,
    required TResult Function(String error) getcruiseFailure,
    required TResult Function() noInternet,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(CruiseModel cruisemodel)? getcruiseuccess,
    TResult? Function(String error)? getcruiseFailure,
    TResult? Function()? noInternet,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CruiseModel cruisemodel)? getcruiseuccess,
    TResult Function(String error)? getcruiseFailure,
    TResult Function()? noInternet,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Getcruiseuccess value) getcruiseuccess,
    required TResult Function(GetcruiseFailure value) getcruiseFailure,
    required TResult Function(_NoInternet value) noInternet,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Getcruiseuccess value)? getcruiseuccess,
    TResult? Function(GetcruiseFailure value)? getcruiseFailure,
    TResult? Function(_NoInternet value)? noInternet,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Getcruiseuccess value)? getcruiseuccess,
    TResult Function(GetcruiseFailure value)? getcruiseFailure,
    TResult Function(_NoInternet value)? noInternet,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ListCruiseonLocationState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$ListCruiseonLocationStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ListCruiseonLocationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'ListCruiseonLocationState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(CruiseModel cruisemodel) getcruiseuccess,
    required TResult Function(String error) getcruiseFailure,
    required TResult Function() noInternet,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(CruiseModel cruisemodel)? getcruiseuccess,
    TResult? Function(String error)? getcruiseFailure,
    TResult? Function()? noInternet,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CruiseModel cruisemodel)? getcruiseuccess,
    TResult Function(String error)? getcruiseFailure,
    TResult Function()? noInternet,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Getcruiseuccess value) getcruiseuccess,
    required TResult Function(GetcruiseFailure value) getcruiseFailure,
    required TResult Function(_NoInternet value) noInternet,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Getcruiseuccess value)? getcruiseuccess,
    TResult? Function(GetcruiseFailure value)? getcruiseFailure,
    TResult? Function(_NoInternet value)? noInternet,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Getcruiseuccess value)? getcruiseuccess,
    TResult Function(GetcruiseFailure value)? getcruiseFailure,
    TResult Function(_NoInternet value)? noInternet,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements ListCruiseonLocationState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$GetcruiseuccessImplCopyWith<$Res> {
  factory _$$GetcruiseuccessImplCopyWith(_$GetcruiseuccessImpl value,
          $Res Function(_$GetcruiseuccessImpl) then) =
      __$$GetcruiseuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CruiseModel cruisemodel});
}

/// @nodoc
class __$$GetcruiseuccessImplCopyWithImpl<$Res>
    extends _$ListCruiseonLocationStateCopyWithImpl<$Res, _$GetcruiseuccessImpl>
    implements _$$GetcruiseuccessImplCopyWith<$Res> {
  __$$GetcruiseuccessImplCopyWithImpl(
      _$GetcruiseuccessImpl _value, $Res Function(_$GetcruiseuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of ListCruiseonLocationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cruisemodel = null,
  }) {
    return _then(_$GetcruiseuccessImpl(
      cruisemodel: null == cruisemodel
          ? _value.cruisemodel
          : cruisemodel // ignore: cast_nullable_to_non_nullable
              as CruiseModel,
    ));
  }
}

/// @nodoc

class _$GetcruiseuccessImpl implements _Getcruiseuccess {
  const _$GetcruiseuccessImpl({required this.cruisemodel});

  @override
  final CruiseModel cruisemodel;

  @override
  String toString() {
    return 'ListCruiseonLocationState.getcruiseuccess(cruisemodel: $cruisemodel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetcruiseuccessImpl &&
            (identical(other.cruisemodel, cruisemodel) ||
                other.cruisemodel == cruisemodel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cruisemodel);

  /// Create a copy of ListCruiseonLocationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetcruiseuccessImplCopyWith<_$GetcruiseuccessImpl> get copyWith =>
      __$$GetcruiseuccessImplCopyWithImpl<_$GetcruiseuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(CruiseModel cruisemodel) getcruiseuccess,
    required TResult Function(String error) getcruiseFailure,
    required TResult Function() noInternet,
  }) {
    return getcruiseuccess(cruisemodel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(CruiseModel cruisemodel)? getcruiseuccess,
    TResult? Function(String error)? getcruiseFailure,
    TResult? Function()? noInternet,
  }) {
    return getcruiseuccess?.call(cruisemodel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CruiseModel cruisemodel)? getcruiseuccess,
    TResult Function(String error)? getcruiseFailure,
    TResult Function()? noInternet,
    required TResult orElse(),
  }) {
    if (getcruiseuccess != null) {
      return getcruiseuccess(cruisemodel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Getcruiseuccess value) getcruiseuccess,
    required TResult Function(GetcruiseFailure value) getcruiseFailure,
    required TResult Function(_NoInternet value) noInternet,
  }) {
    return getcruiseuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Getcruiseuccess value)? getcruiseuccess,
    TResult? Function(GetcruiseFailure value)? getcruiseFailure,
    TResult? Function(_NoInternet value)? noInternet,
  }) {
    return getcruiseuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Getcruiseuccess value)? getcruiseuccess,
    TResult Function(GetcruiseFailure value)? getcruiseFailure,
    TResult Function(_NoInternet value)? noInternet,
    required TResult orElse(),
  }) {
    if (getcruiseuccess != null) {
      return getcruiseuccess(this);
    }
    return orElse();
  }
}

abstract class _Getcruiseuccess implements ListCruiseonLocationState {
  const factory _Getcruiseuccess({required final CruiseModel cruisemodel}) =
      _$GetcruiseuccessImpl;

  CruiseModel get cruisemodel;

  /// Create a copy of ListCruiseonLocationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetcruiseuccessImplCopyWith<_$GetcruiseuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetcruiseFailureImplCopyWith<$Res> {
  factory _$$GetcruiseFailureImplCopyWith(_$GetcruiseFailureImpl value,
          $Res Function(_$GetcruiseFailureImpl) then) =
      __$$GetcruiseFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$GetcruiseFailureImplCopyWithImpl<$Res>
    extends _$ListCruiseonLocationStateCopyWithImpl<$Res,
        _$GetcruiseFailureImpl>
    implements _$$GetcruiseFailureImplCopyWith<$Res> {
  __$$GetcruiseFailureImplCopyWithImpl(_$GetcruiseFailureImpl _value,
      $Res Function(_$GetcruiseFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of ListCruiseonLocationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$GetcruiseFailureImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetcruiseFailureImpl implements GetcruiseFailure {
  const _$GetcruiseFailureImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'ListCruiseonLocationState.getcruiseFailure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetcruiseFailureImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of ListCruiseonLocationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetcruiseFailureImplCopyWith<_$GetcruiseFailureImpl> get copyWith =>
      __$$GetcruiseFailureImplCopyWithImpl<_$GetcruiseFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(CruiseModel cruisemodel) getcruiseuccess,
    required TResult Function(String error) getcruiseFailure,
    required TResult Function() noInternet,
  }) {
    return getcruiseFailure(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(CruiseModel cruisemodel)? getcruiseuccess,
    TResult? Function(String error)? getcruiseFailure,
    TResult? Function()? noInternet,
  }) {
    return getcruiseFailure?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CruiseModel cruisemodel)? getcruiseuccess,
    TResult Function(String error)? getcruiseFailure,
    TResult Function()? noInternet,
    required TResult orElse(),
  }) {
    if (getcruiseFailure != null) {
      return getcruiseFailure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Getcruiseuccess value) getcruiseuccess,
    required TResult Function(GetcruiseFailure value) getcruiseFailure,
    required TResult Function(_NoInternet value) noInternet,
  }) {
    return getcruiseFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Getcruiseuccess value)? getcruiseuccess,
    TResult? Function(GetcruiseFailure value)? getcruiseFailure,
    TResult? Function(_NoInternet value)? noInternet,
  }) {
    return getcruiseFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Getcruiseuccess value)? getcruiseuccess,
    TResult Function(GetcruiseFailure value)? getcruiseFailure,
    TResult Function(_NoInternet value)? noInternet,
    required TResult orElse(),
  }) {
    if (getcruiseFailure != null) {
      return getcruiseFailure(this);
    }
    return orElse();
  }
}

abstract class GetcruiseFailure implements ListCruiseonLocationState {
  const factory GetcruiseFailure({required final String error}) =
      _$GetcruiseFailureImpl;

  String get error;

  /// Create a copy of ListCruiseonLocationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetcruiseFailureImplCopyWith<_$GetcruiseFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NoInternetImplCopyWith<$Res> {
  factory _$$NoInternetImplCopyWith(
          _$NoInternetImpl value, $Res Function(_$NoInternetImpl) then) =
      __$$NoInternetImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NoInternetImplCopyWithImpl<$Res>
    extends _$ListCruiseonLocationStateCopyWithImpl<$Res, _$NoInternetImpl>
    implements _$$NoInternetImplCopyWith<$Res> {
  __$$NoInternetImplCopyWithImpl(
      _$NoInternetImpl _value, $Res Function(_$NoInternetImpl) _then)
      : super(_value, _then);

  /// Create a copy of ListCruiseonLocationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$NoInternetImpl implements _NoInternet {
  const _$NoInternetImpl();

  @override
  String toString() {
    return 'ListCruiseonLocationState.noInternet()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NoInternetImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(CruiseModel cruisemodel) getcruiseuccess,
    required TResult Function(String error) getcruiseFailure,
    required TResult Function() noInternet,
  }) {
    return noInternet();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(CruiseModel cruisemodel)? getcruiseuccess,
    TResult? Function(String error)? getcruiseFailure,
    TResult? Function()? noInternet,
  }) {
    return noInternet?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CruiseModel cruisemodel)? getcruiseuccess,
    TResult Function(String error)? getcruiseFailure,
    TResult Function()? noInternet,
    required TResult orElse(),
  }) {
    if (noInternet != null) {
      return noInternet();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Getcruiseuccess value) getcruiseuccess,
    required TResult Function(GetcruiseFailure value) getcruiseFailure,
    required TResult Function(_NoInternet value) noInternet,
  }) {
    return noInternet(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Getcruiseuccess value)? getcruiseuccess,
    TResult? Function(GetcruiseFailure value)? getcruiseFailure,
    TResult? Function(_NoInternet value)? noInternet,
  }) {
    return noInternet?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Getcruiseuccess value)? getcruiseuccess,
    TResult Function(GetcruiseFailure value)? getcruiseFailure,
    TResult Function(_NoInternet value)? noInternet,
    required TResult orElse(),
  }) {
    if (noInternet != null) {
      return noInternet(this);
    }
    return orElse();
  }
}

abstract class _NoInternet implements ListCruiseonLocationState {
  const factory _NoInternet() = _$NoInternetImpl;
}
