// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'view_my_package_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ViewMyPackageEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String packageId) viewMyPackage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String packageId)? viewMyPackage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String packageId)? viewMyPackage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ViewMyPackage value) viewMyPackage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ViewMyPackage value)? viewMyPackage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ViewMyPackage value)? viewMyPackage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewMyPackageEventCopyWith<$Res> {
  factory $ViewMyPackageEventCopyWith(
          ViewMyPackageEvent value, $Res Function(ViewMyPackageEvent) then) =
      _$ViewMyPackageEventCopyWithImpl<$Res, ViewMyPackageEvent>;
}

/// @nodoc
class _$ViewMyPackageEventCopyWithImpl<$Res, $Val extends ViewMyPackageEvent>
    implements $ViewMyPackageEventCopyWith<$Res> {
  _$ViewMyPackageEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ViewMyPackageEvent
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
    extends _$ViewMyPackageEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ViewMyPackageEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'ViewMyPackageEvent.started()';
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
    required TResult Function(String packageId) viewMyPackage,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String packageId)? viewMyPackage,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String packageId)? viewMyPackage,
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
    required TResult Function(_ViewMyPackage value) viewMyPackage,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ViewMyPackage value)? viewMyPackage,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ViewMyPackage value)? viewMyPackage,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements ViewMyPackageEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$ViewMyPackageImplCopyWith<$Res> {
  factory _$$ViewMyPackageImplCopyWith(
          _$ViewMyPackageImpl value, $Res Function(_$ViewMyPackageImpl) then) =
      __$$ViewMyPackageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String packageId});
}

/// @nodoc
class __$$ViewMyPackageImplCopyWithImpl<$Res>
    extends _$ViewMyPackageEventCopyWithImpl<$Res, _$ViewMyPackageImpl>
    implements _$$ViewMyPackageImplCopyWith<$Res> {
  __$$ViewMyPackageImplCopyWithImpl(
      _$ViewMyPackageImpl _value, $Res Function(_$ViewMyPackageImpl) _then)
      : super(_value, _then);

  /// Create a copy of ViewMyPackageEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? packageId = null,
  }) {
    return _then(_$ViewMyPackageImpl(
      packageId: null == packageId
          ? _value.packageId
          : packageId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ViewMyPackageImpl implements _ViewMyPackage {
  const _$ViewMyPackageImpl({required this.packageId});

  @override
  final String packageId;

  @override
  String toString() {
    return 'ViewMyPackageEvent.viewMyPackage(packageId: $packageId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ViewMyPackageImpl &&
            (identical(other.packageId, packageId) ||
                other.packageId == packageId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, packageId);

  /// Create a copy of ViewMyPackageEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ViewMyPackageImplCopyWith<_$ViewMyPackageImpl> get copyWith =>
      __$$ViewMyPackageImplCopyWithImpl<_$ViewMyPackageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String packageId) viewMyPackage,
  }) {
    return viewMyPackage(packageId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String packageId)? viewMyPackage,
  }) {
    return viewMyPackage?.call(packageId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String packageId)? viewMyPackage,
    required TResult orElse(),
  }) {
    if (viewMyPackage != null) {
      return viewMyPackage(packageId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ViewMyPackage value) viewMyPackage,
  }) {
    return viewMyPackage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ViewMyPackage value)? viewMyPackage,
  }) {
    return viewMyPackage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ViewMyPackage value)? viewMyPackage,
    required TResult orElse(),
  }) {
    if (viewMyPackage != null) {
      return viewMyPackage(this);
    }
    return orElse();
  }
}

abstract class _ViewMyPackage implements ViewMyPackageEvent {
  const factory _ViewMyPackage({required final String packageId}) =
      _$ViewMyPackageImpl;

  String get packageId;

  /// Create a copy of ViewMyPackageEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ViewMyPackageImplCopyWith<_$ViewMyPackageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ViewMyPackageState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ViewmyPackageModel mybookingmodel) viewMyPacakge,
    required TResult Function(String error) getuserFailure,
    required TResult Function() noInternet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ViewmyPackageModel mybookingmodel)? viewMyPacakge,
    TResult? Function(String error)? getuserFailure,
    TResult? Function()? noInternet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ViewmyPackageModel mybookingmodel)? viewMyPacakge,
    TResult Function(String error)? getuserFailure,
    TResult Function()? noInternet,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_ViewMyPacakge value) viewMyPacakge,
    required TResult Function(GetuserFailure value) getuserFailure,
    required TResult Function(_NoInternet value) noInternet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_ViewMyPacakge value)? viewMyPacakge,
    TResult? Function(GetuserFailure value)? getuserFailure,
    TResult? Function(_NoInternet value)? noInternet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_ViewMyPacakge value)? viewMyPacakge,
    TResult Function(GetuserFailure value)? getuserFailure,
    TResult Function(_NoInternet value)? noInternet,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewMyPackageStateCopyWith<$Res> {
  factory $ViewMyPackageStateCopyWith(
          ViewMyPackageState value, $Res Function(ViewMyPackageState) then) =
      _$ViewMyPackageStateCopyWithImpl<$Res, ViewMyPackageState>;
}

/// @nodoc
class _$ViewMyPackageStateCopyWithImpl<$Res, $Val extends ViewMyPackageState>
    implements $ViewMyPackageStateCopyWith<$Res> {
  _$ViewMyPackageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ViewMyPackageState
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
    extends _$ViewMyPackageStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of ViewMyPackageState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'ViewMyPackageState.initial()';
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
    required TResult Function(ViewmyPackageModel mybookingmodel) viewMyPacakge,
    required TResult Function(String error) getuserFailure,
    required TResult Function() noInternet,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ViewmyPackageModel mybookingmodel)? viewMyPacakge,
    TResult? Function(String error)? getuserFailure,
    TResult? Function()? noInternet,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ViewmyPackageModel mybookingmodel)? viewMyPacakge,
    TResult Function(String error)? getuserFailure,
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
    required TResult Function(_ViewMyPacakge value) viewMyPacakge,
    required TResult Function(GetuserFailure value) getuserFailure,
    required TResult Function(_NoInternet value) noInternet,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_ViewMyPacakge value)? viewMyPacakge,
    TResult? Function(GetuserFailure value)? getuserFailure,
    TResult? Function(_NoInternet value)? noInternet,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_ViewMyPacakge value)? viewMyPacakge,
    TResult Function(GetuserFailure value)? getuserFailure,
    TResult Function(_NoInternet value)? noInternet,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ViewMyPackageState {
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
    extends _$ViewMyPackageStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ViewMyPackageState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'ViewMyPackageState.loading()';
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
    required TResult Function(ViewmyPackageModel mybookingmodel) viewMyPacakge,
    required TResult Function(String error) getuserFailure,
    required TResult Function() noInternet,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ViewmyPackageModel mybookingmodel)? viewMyPacakge,
    TResult? Function(String error)? getuserFailure,
    TResult? Function()? noInternet,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ViewmyPackageModel mybookingmodel)? viewMyPacakge,
    TResult Function(String error)? getuserFailure,
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
    required TResult Function(_ViewMyPacakge value) viewMyPacakge,
    required TResult Function(GetuserFailure value) getuserFailure,
    required TResult Function(_NoInternet value) noInternet,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_ViewMyPacakge value)? viewMyPacakge,
    TResult? Function(GetuserFailure value)? getuserFailure,
    TResult? Function(_NoInternet value)? noInternet,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_ViewMyPacakge value)? viewMyPacakge,
    TResult Function(GetuserFailure value)? getuserFailure,
    TResult Function(_NoInternet value)? noInternet,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements ViewMyPackageState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$ViewMyPacakgeImplCopyWith<$Res> {
  factory _$$ViewMyPacakgeImplCopyWith(
          _$ViewMyPacakgeImpl value, $Res Function(_$ViewMyPacakgeImpl) then) =
      __$$ViewMyPacakgeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ViewmyPackageModel mybookingmodel});
}

/// @nodoc
class __$$ViewMyPacakgeImplCopyWithImpl<$Res>
    extends _$ViewMyPackageStateCopyWithImpl<$Res, _$ViewMyPacakgeImpl>
    implements _$$ViewMyPacakgeImplCopyWith<$Res> {
  __$$ViewMyPacakgeImplCopyWithImpl(
      _$ViewMyPacakgeImpl _value, $Res Function(_$ViewMyPacakgeImpl) _then)
      : super(_value, _then);

  /// Create a copy of ViewMyPackageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mybookingmodel = null,
  }) {
    return _then(_$ViewMyPacakgeImpl(
      mybookingmodel: null == mybookingmodel
          ? _value.mybookingmodel
          : mybookingmodel // ignore: cast_nullable_to_non_nullable
              as ViewmyPackageModel,
    ));
  }
}

/// @nodoc

class _$ViewMyPacakgeImpl implements _ViewMyPacakge {
  const _$ViewMyPacakgeImpl({required this.mybookingmodel});

  @override
  final ViewmyPackageModel mybookingmodel;

  @override
  String toString() {
    return 'ViewMyPackageState.viewMyPacakge(mybookingmodel: $mybookingmodel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ViewMyPacakgeImpl &&
            (identical(other.mybookingmodel, mybookingmodel) ||
                other.mybookingmodel == mybookingmodel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, mybookingmodel);

  /// Create a copy of ViewMyPackageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ViewMyPacakgeImplCopyWith<_$ViewMyPacakgeImpl> get copyWith =>
      __$$ViewMyPacakgeImplCopyWithImpl<_$ViewMyPacakgeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ViewmyPackageModel mybookingmodel) viewMyPacakge,
    required TResult Function(String error) getuserFailure,
    required TResult Function() noInternet,
  }) {
    return viewMyPacakge(mybookingmodel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ViewmyPackageModel mybookingmodel)? viewMyPacakge,
    TResult? Function(String error)? getuserFailure,
    TResult? Function()? noInternet,
  }) {
    return viewMyPacakge?.call(mybookingmodel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ViewmyPackageModel mybookingmodel)? viewMyPacakge,
    TResult Function(String error)? getuserFailure,
    TResult Function()? noInternet,
    required TResult orElse(),
  }) {
    if (viewMyPacakge != null) {
      return viewMyPacakge(mybookingmodel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_ViewMyPacakge value) viewMyPacakge,
    required TResult Function(GetuserFailure value) getuserFailure,
    required TResult Function(_NoInternet value) noInternet,
  }) {
    return viewMyPacakge(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_ViewMyPacakge value)? viewMyPacakge,
    TResult? Function(GetuserFailure value)? getuserFailure,
    TResult? Function(_NoInternet value)? noInternet,
  }) {
    return viewMyPacakge?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_ViewMyPacakge value)? viewMyPacakge,
    TResult Function(GetuserFailure value)? getuserFailure,
    TResult Function(_NoInternet value)? noInternet,
    required TResult orElse(),
  }) {
    if (viewMyPacakge != null) {
      return viewMyPacakge(this);
    }
    return orElse();
  }
}

abstract class _ViewMyPacakge implements ViewMyPackageState {
  const factory _ViewMyPacakge(
      {required final ViewmyPackageModel mybookingmodel}) = _$ViewMyPacakgeImpl;

  ViewmyPackageModel get mybookingmodel;

  /// Create a copy of ViewMyPackageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ViewMyPacakgeImplCopyWith<_$ViewMyPacakgeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetuserFailureImplCopyWith<$Res> {
  factory _$$GetuserFailureImplCopyWith(_$GetuserFailureImpl value,
          $Res Function(_$GetuserFailureImpl) then) =
      __$$GetuserFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$GetuserFailureImplCopyWithImpl<$Res>
    extends _$ViewMyPackageStateCopyWithImpl<$Res, _$GetuserFailureImpl>
    implements _$$GetuserFailureImplCopyWith<$Res> {
  __$$GetuserFailureImplCopyWithImpl(
      _$GetuserFailureImpl _value, $Res Function(_$GetuserFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of ViewMyPackageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$GetuserFailureImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetuserFailureImpl implements GetuserFailure {
  const _$GetuserFailureImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'ViewMyPackageState.getuserFailure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetuserFailureImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of ViewMyPackageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetuserFailureImplCopyWith<_$GetuserFailureImpl> get copyWith =>
      __$$GetuserFailureImplCopyWithImpl<_$GetuserFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ViewmyPackageModel mybookingmodel) viewMyPacakge,
    required TResult Function(String error) getuserFailure,
    required TResult Function() noInternet,
  }) {
    return getuserFailure(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ViewmyPackageModel mybookingmodel)? viewMyPacakge,
    TResult? Function(String error)? getuserFailure,
    TResult? Function()? noInternet,
  }) {
    return getuserFailure?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ViewmyPackageModel mybookingmodel)? viewMyPacakge,
    TResult Function(String error)? getuserFailure,
    TResult Function()? noInternet,
    required TResult orElse(),
  }) {
    if (getuserFailure != null) {
      return getuserFailure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_ViewMyPacakge value) viewMyPacakge,
    required TResult Function(GetuserFailure value) getuserFailure,
    required TResult Function(_NoInternet value) noInternet,
  }) {
    return getuserFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_ViewMyPacakge value)? viewMyPacakge,
    TResult? Function(GetuserFailure value)? getuserFailure,
    TResult? Function(_NoInternet value)? noInternet,
  }) {
    return getuserFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_ViewMyPacakge value)? viewMyPacakge,
    TResult Function(GetuserFailure value)? getuserFailure,
    TResult Function(_NoInternet value)? noInternet,
    required TResult orElse(),
  }) {
    if (getuserFailure != null) {
      return getuserFailure(this);
    }
    return orElse();
  }
}

abstract class GetuserFailure implements ViewMyPackageState {
  const factory GetuserFailure({required final String error}) =
      _$GetuserFailureImpl;

  String get error;

  /// Create a copy of ViewMyPackageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetuserFailureImplCopyWith<_$GetuserFailureImpl> get copyWith =>
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
    extends _$ViewMyPackageStateCopyWithImpl<$Res, _$NoInternetImpl>
    implements _$$NoInternetImplCopyWith<$Res> {
  __$$NoInternetImplCopyWithImpl(
      _$NoInternetImpl _value, $Res Function(_$NoInternetImpl) _then)
      : super(_value, _then);

  /// Create a copy of ViewMyPackageState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$NoInternetImpl implements _NoInternet {
  const _$NoInternetImpl();

  @override
  String toString() {
    return 'ViewMyPackageState.noInternet()';
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
    required TResult Function(ViewmyPackageModel mybookingmodel) viewMyPacakge,
    required TResult Function(String error) getuserFailure,
    required TResult Function() noInternet,
  }) {
    return noInternet();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ViewmyPackageModel mybookingmodel)? viewMyPacakge,
    TResult? Function(String error)? getuserFailure,
    TResult? Function()? noInternet,
  }) {
    return noInternet?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ViewmyPackageModel mybookingmodel)? viewMyPacakge,
    TResult Function(String error)? getuserFailure,
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
    required TResult Function(_ViewMyPacakge value) viewMyPacakge,
    required TResult Function(GetuserFailure value) getuserFailure,
    required TResult Function(_NoInternet value) noInternet,
  }) {
    return noInternet(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_ViewMyPacakge value)? viewMyPacakge,
    TResult? Function(GetuserFailure value)? getuserFailure,
    TResult? Function(_NoInternet value)? noInternet,
  }) {
    return noInternet?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_ViewMyPacakge value)? viewMyPacakge,
    TResult Function(GetuserFailure value)? getuserFailure,
    TResult Function(_NoInternet value)? noInternet,
    required TResult orElse(),
  }) {
    if (noInternet != null) {
      return noInternet(this);
    }
    return orElse();
  }
}

abstract class _NoInternet implements ViewMyPackageState {
  const factory _NoInternet() = _$NoInternetImpl;
}
