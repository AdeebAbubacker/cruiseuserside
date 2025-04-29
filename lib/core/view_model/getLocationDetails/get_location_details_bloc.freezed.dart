// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_location_details_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GetLocationDetailsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String? locationName) getLocation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String? locationName)? getLocation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String? locationName)? getLocation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetLocation value) getLocation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetLocation value)? getLocation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetLocation value)? getLocation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetLocationDetailsEventCopyWith<$Res> {
  factory $GetLocationDetailsEventCopyWith(GetLocationDetailsEvent value,
          $Res Function(GetLocationDetailsEvent) then) =
      _$GetLocationDetailsEventCopyWithImpl<$Res, GetLocationDetailsEvent>;
}

/// @nodoc
class _$GetLocationDetailsEventCopyWithImpl<$Res,
        $Val extends GetLocationDetailsEvent>
    implements $GetLocationDetailsEventCopyWith<$Res> {
  _$GetLocationDetailsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetLocationDetailsEvent
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
    extends _$GetLocationDetailsEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetLocationDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'GetLocationDetailsEvent.started()';
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
    required TResult Function(String? locationName) getLocation,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String? locationName)? getLocation,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String? locationName)? getLocation,
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
    required TResult Function(_GetLocation value) getLocation,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetLocation value)? getLocation,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetLocation value)? getLocation,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements GetLocationDetailsEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$GetLocationImplCopyWith<$Res> {
  factory _$$GetLocationImplCopyWith(
          _$GetLocationImpl value, $Res Function(_$GetLocationImpl) then) =
      __$$GetLocationImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? locationName});
}

/// @nodoc
class __$$GetLocationImplCopyWithImpl<$Res>
    extends _$GetLocationDetailsEventCopyWithImpl<$Res, _$GetLocationImpl>
    implements _$$GetLocationImplCopyWith<$Res> {
  __$$GetLocationImplCopyWithImpl(
      _$GetLocationImpl _value, $Res Function(_$GetLocationImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetLocationDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locationName = freezed,
  }) {
    return _then(_$GetLocationImpl(
      locationName: freezed == locationName
          ? _value.locationName
          : locationName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$GetLocationImpl implements _GetLocation {
  const _$GetLocationImpl({this.locationName});

  @override
  final String? locationName;

  @override
  String toString() {
    return 'GetLocationDetailsEvent.getLocation(locationName: $locationName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetLocationImpl &&
            (identical(other.locationName, locationName) ||
                other.locationName == locationName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, locationName);

  /// Create a copy of GetLocationDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetLocationImplCopyWith<_$GetLocationImpl> get copyWith =>
      __$$GetLocationImplCopyWithImpl<_$GetLocationImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String? locationName) getLocation,
  }) {
    return getLocation(locationName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String? locationName)? getLocation,
  }) {
    return getLocation?.call(locationName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String? locationName)? getLocation,
    required TResult orElse(),
  }) {
    if (getLocation != null) {
      return getLocation(locationName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetLocation value) getLocation,
  }) {
    return getLocation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetLocation value)? getLocation,
  }) {
    return getLocation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetLocation value)? getLocation,
    required TResult orElse(),
  }) {
    if (getLocation != null) {
      return getLocation(this);
    }
    return orElse();
  }
}

abstract class _GetLocation implements GetLocationDetailsEvent {
  const factory _GetLocation({final String? locationName}) = _$GetLocationImpl;

  String? get locationName;

  /// Create a copy of GetLocationDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetLocationImplCopyWith<_$GetLocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GetLocationDetailsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(LocationModel locationmodel) getLocationDetails,
    required TResult Function(String error) getlocationsFailure,
    required TResult Function() noInternet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(LocationModel locationmodel)? getLocationDetails,
    TResult? Function(String error)? getlocationsFailure,
    TResult? Function()? noInternet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(LocationModel locationmodel)? getLocationDetails,
    TResult Function(String error)? getlocationsFailure,
    TResult Function()? noInternet,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_GetLocationDetails value) getLocationDetails,
    required TResult Function(GetlocationsFailure value) getlocationsFailure,
    required TResult Function(_NoInternet value) noInternet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_GetLocationDetails value)? getLocationDetails,
    TResult? Function(GetlocationsFailure value)? getlocationsFailure,
    TResult? Function(_NoInternet value)? noInternet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_GetLocationDetails value)? getLocationDetails,
    TResult Function(GetlocationsFailure value)? getlocationsFailure,
    TResult Function(_NoInternet value)? noInternet,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetLocationDetailsStateCopyWith<$Res> {
  factory $GetLocationDetailsStateCopyWith(GetLocationDetailsState value,
          $Res Function(GetLocationDetailsState) then) =
      _$GetLocationDetailsStateCopyWithImpl<$Res, GetLocationDetailsState>;
}

/// @nodoc
class _$GetLocationDetailsStateCopyWithImpl<$Res,
        $Val extends GetLocationDetailsState>
    implements $GetLocationDetailsStateCopyWith<$Res> {
  _$GetLocationDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetLocationDetailsState
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
    extends _$GetLocationDetailsStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetLocationDetailsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'GetLocationDetailsState.initial()';
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
    required TResult Function(LocationModel locationmodel) getLocationDetails,
    required TResult Function(String error) getlocationsFailure,
    required TResult Function() noInternet,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(LocationModel locationmodel)? getLocationDetails,
    TResult? Function(String error)? getlocationsFailure,
    TResult? Function()? noInternet,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(LocationModel locationmodel)? getLocationDetails,
    TResult Function(String error)? getlocationsFailure,
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
    required TResult Function(_GetLocationDetails value) getLocationDetails,
    required TResult Function(GetlocationsFailure value) getlocationsFailure,
    required TResult Function(_NoInternet value) noInternet,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_GetLocationDetails value)? getLocationDetails,
    TResult? Function(GetlocationsFailure value)? getlocationsFailure,
    TResult? Function(_NoInternet value)? noInternet,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_GetLocationDetails value)? getLocationDetails,
    TResult Function(GetlocationsFailure value)? getlocationsFailure,
    TResult Function(_NoInternet value)? noInternet,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements GetLocationDetailsState {
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
    extends _$GetLocationDetailsStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetLocationDetailsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'GetLocationDetailsState.loading()';
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
    required TResult Function(LocationModel locationmodel) getLocationDetails,
    required TResult Function(String error) getlocationsFailure,
    required TResult Function() noInternet,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(LocationModel locationmodel)? getLocationDetails,
    TResult? Function(String error)? getlocationsFailure,
    TResult? Function()? noInternet,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(LocationModel locationmodel)? getLocationDetails,
    TResult Function(String error)? getlocationsFailure,
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
    required TResult Function(_GetLocationDetails value) getLocationDetails,
    required TResult Function(GetlocationsFailure value) getlocationsFailure,
    required TResult Function(_NoInternet value) noInternet,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_GetLocationDetails value)? getLocationDetails,
    TResult? Function(GetlocationsFailure value)? getlocationsFailure,
    TResult? Function(_NoInternet value)? noInternet,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_GetLocationDetails value)? getLocationDetails,
    TResult Function(GetlocationsFailure value)? getlocationsFailure,
    TResult Function(_NoInternet value)? noInternet,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements GetLocationDetailsState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$GetLocationDetailsImplCopyWith<$Res> {
  factory _$$GetLocationDetailsImplCopyWith(_$GetLocationDetailsImpl value,
          $Res Function(_$GetLocationDetailsImpl) then) =
      __$$GetLocationDetailsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({LocationModel locationmodel});
}

/// @nodoc
class __$$GetLocationDetailsImplCopyWithImpl<$Res>
    extends _$GetLocationDetailsStateCopyWithImpl<$Res,
        _$GetLocationDetailsImpl>
    implements _$$GetLocationDetailsImplCopyWith<$Res> {
  __$$GetLocationDetailsImplCopyWithImpl(_$GetLocationDetailsImpl _value,
      $Res Function(_$GetLocationDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetLocationDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locationmodel = null,
  }) {
    return _then(_$GetLocationDetailsImpl(
      locationmodel: null == locationmodel
          ? _value.locationmodel
          : locationmodel // ignore: cast_nullable_to_non_nullable
              as LocationModel,
    ));
  }
}

/// @nodoc

class _$GetLocationDetailsImpl implements _GetLocationDetails {
  const _$GetLocationDetailsImpl({required this.locationmodel});

  @override
  final LocationModel locationmodel;

  @override
  String toString() {
    return 'GetLocationDetailsState.getLocationDetails(locationmodel: $locationmodel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetLocationDetailsImpl &&
            (identical(other.locationmodel, locationmodel) ||
                other.locationmodel == locationmodel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, locationmodel);

  /// Create a copy of GetLocationDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetLocationDetailsImplCopyWith<_$GetLocationDetailsImpl> get copyWith =>
      __$$GetLocationDetailsImplCopyWithImpl<_$GetLocationDetailsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(LocationModel locationmodel) getLocationDetails,
    required TResult Function(String error) getlocationsFailure,
    required TResult Function() noInternet,
  }) {
    return getLocationDetails(locationmodel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(LocationModel locationmodel)? getLocationDetails,
    TResult? Function(String error)? getlocationsFailure,
    TResult? Function()? noInternet,
  }) {
    return getLocationDetails?.call(locationmodel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(LocationModel locationmodel)? getLocationDetails,
    TResult Function(String error)? getlocationsFailure,
    TResult Function()? noInternet,
    required TResult orElse(),
  }) {
    if (getLocationDetails != null) {
      return getLocationDetails(locationmodel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_GetLocationDetails value) getLocationDetails,
    required TResult Function(GetlocationsFailure value) getlocationsFailure,
    required TResult Function(_NoInternet value) noInternet,
  }) {
    return getLocationDetails(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_GetLocationDetails value)? getLocationDetails,
    TResult? Function(GetlocationsFailure value)? getlocationsFailure,
    TResult? Function(_NoInternet value)? noInternet,
  }) {
    return getLocationDetails?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_GetLocationDetails value)? getLocationDetails,
    TResult Function(GetlocationsFailure value)? getlocationsFailure,
    TResult Function(_NoInternet value)? noInternet,
    required TResult orElse(),
  }) {
    if (getLocationDetails != null) {
      return getLocationDetails(this);
    }
    return orElse();
  }
}

abstract class _GetLocationDetails implements GetLocationDetailsState {
  const factory _GetLocationDetails(
      {required final LocationModel locationmodel}) = _$GetLocationDetailsImpl;

  LocationModel get locationmodel;

  /// Create a copy of GetLocationDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetLocationDetailsImplCopyWith<_$GetLocationDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetlocationsFailureImplCopyWith<$Res> {
  factory _$$GetlocationsFailureImplCopyWith(_$GetlocationsFailureImpl value,
          $Res Function(_$GetlocationsFailureImpl) then) =
      __$$GetlocationsFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$GetlocationsFailureImplCopyWithImpl<$Res>
    extends _$GetLocationDetailsStateCopyWithImpl<$Res,
        _$GetlocationsFailureImpl>
    implements _$$GetlocationsFailureImplCopyWith<$Res> {
  __$$GetlocationsFailureImplCopyWithImpl(_$GetlocationsFailureImpl _value,
      $Res Function(_$GetlocationsFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetLocationDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$GetlocationsFailureImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetlocationsFailureImpl implements GetlocationsFailure {
  const _$GetlocationsFailureImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'GetLocationDetailsState.getlocationsFailure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetlocationsFailureImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of GetLocationDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetlocationsFailureImplCopyWith<_$GetlocationsFailureImpl> get copyWith =>
      __$$GetlocationsFailureImplCopyWithImpl<_$GetlocationsFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(LocationModel locationmodel) getLocationDetails,
    required TResult Function(String error) getlocationsFailure,
    required TResult Function() noInternet,
  }) {
    return getlocationsFailure(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(LocationModel locationmodel)? getLocationDetails,
    TResult? Function(String error)? getlocationsFailure,
    TResult? Function()? noInternet,
  }) {
    return getlocationsFailure?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(LocationModel locationmodel)? getLocationDetails,
    TResult Function(String error)? getlocationsFailure,
    TResult Function()? noInternet,
    required TResult orElse(),
  }) {
    if (getlocationsFailure != null) {
      return getlocationsFailure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_GetLocationDetails value) getLocationDetails,
    required TResult Function(GetlocationsFailure value) getlocationsFailure,
    required TResult Function(_NoInternet value) noInternet,
  }) {
    return getlocationsFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_GetLocationDetails value)? getLocationDetails,
    TResult? Function(GetlocationsFailure value)? getlocationsFailure,
    TResult? Function(_NoInternet value)? noInternet,
  }) {
    return getlocationsFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_GetLocationDetails value)? getLocationDetails,
    TResult Function(GetlocationsFailure value)? getlocationsFailure,
    TResult Function(_NoInternet value)? noInternet,
    required TResult orElse(),
  }) {
    if (getlocationsFailure != null) {
      return getlocationsFailure(this);
    }
    return orElse();
  }
}

abstract class GetlocationsFailure implements GetLocationDetailsState {
  const factory GetlocationsFailure({required final String error}) =
      _$GetlocationsFailureImpl;

  String get error;

  /// Create a copy of GetLocationDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetlocationsFailureImplCopyWith<_$GetlocationsFailureImpl> get copyWith =>
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
    extends _$GetLocationDetailsStateCopyWithImpl<$Res, _$NoInternetImpl>
    implements _$$NoInternetImplCopyWith<$Res> {
  __$$NoInternetImplCopyWithImpl(
      _$NoInternetImpl _value, $Res Function(_$NoInternetImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetLocationDetailsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$NoInternetImpl implements _NoInternet {
  const _$NoInternetImpl();

  @override
  String toString() {
    return 'GetLocationDetailsState.noInternet()';
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
    required TResult Function(LocationModel locationmodel) getLocationDetails,
    required TResult Function(String error) getlocationsFailure,
    required TResult Function() noInternet,
  }) {
    return noInternet();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(LocationModel locationmodel)? getLocationDetails,
    TResult? Function(String error)? getlocationsFailure,
    TResult? Function()? noInternet,
  }) {
    return noInternet?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(LocationModel locationmodel)? getLocationDetails,
    TResult Function(String error)? getlocationsFailure,
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
    required TResult Function(_GetLocationDetails value) getLocationDetails,
    required TResult Function(GetlocationsFailure value) getlocationsFailure,
    required TResult Function(_NoInternet value) noInternet,
  }) {
    return noInternet(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_GetLocationDetails value)? getLocationDetails,
    TResult? Function(GetlocationsFailure value)? getlocationsFailure,
    TResult? Function(_NoInternet value)? noInternet,
  }) {
    return noInternet?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_GetLocationDetails value)? getLocationDetails,
    TResult Function(GetlocationsFailure value)? getlocationsFailure,
    TResult Function(_NoInternet value)? noInternet,
    required TResult orElse(),
  }) {
    if (noInternet != null) {
      return noInternet(this);
    }
    return orElse();
  }
}

abstract class _NoInternet implements GetLocationDetailsState {
  const factory _NoInternet() = _$NoInternetImpl;
}
