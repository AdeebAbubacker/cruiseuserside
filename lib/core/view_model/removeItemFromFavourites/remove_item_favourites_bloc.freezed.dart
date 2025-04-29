// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remove_item_favourites_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RemoveItemFavouritesEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String favouritesId) added,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String favouritesId)? added,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String favouritesId)? added,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_RemoveItemFavourites value) added,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_RemoveItemFavourites value)? added,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_RemoveItemFavourites value)? added,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemoveItemFavouritesEventCopyWith<$Res> {
  factory $RemoveItemFavouritesEventCopyWith(RemoveItemFavouritesEvent value,
          $Res Function(RemoveItemFavouritesEvent) then) =
      _$RemoveItemFavouritesEventCopyWithImpl<$Res, RemoveItemFavouritesEvent>;
}

/// @nodoc
class _$RemoveItemFavouritesEventCopyWithImpl<$Res,
        $Val extends RemoveItemFavouritesEvent>
    implements $RemoveItemFavouritesEventCopyWith<$Res> {
  _$RemoveItemFavouritesEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RemoveItemFavouritesEvent
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
    extends _$RemoveItemFavouritesEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of RemoveItemFavouritesEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'RemoveItemFavouritesEvent.started()';
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
    required TResult Function(String favouritesId) added,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String favouritesId)? added,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String favouritesId)? added,
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
    required TResult Function(_RemoveItemFavourites value) added,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_RemoveItemFavourites value)? added,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_RemoveItemFavourites value)? added,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements RemoveItemFavouritesEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$RemoveItemFavouritesImplCopyWith<$Res> {
  factory _$$RemoveItemFavouritesImplCopyWith(_$RemoveItemFavouritesImpl value,
          $Res Function(_$RemoveItemFavouritesImpl) then) =
      __$$RemoveItemFavouritesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String favouritesId});
}

/// @nodoc
class __$$RemoveItemFavouritesImplCopyWithImpl<$Res>
    extends _$RemoveItemFavouritesEventCopyWithImpl<$Res,
        _$RemoveItemFavouritesImpl>
    implements _$$RemoveItemFavouritesImplCopyWith<$Res> {
  __$$RemoveItemFavouritesImplCopyWithImpl(_$RemoveItemFavouritesImpl _value,
      $Res Function(_$RemoveItemFavouritesImpl) _then)
      : super(_value, _then);

  /// Create a copy of RemoveItemFavouritesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? favouritesId = null,
  }) {
    return _then(_$RemoveItemFavouritesImpl(
      favouritesId: null == favouritesId
          ? _value.favouritesId
          : favouritesId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RemoveItemFavouritesImpl implements _RemoveItemFavourites {
  const _$RemoveItemFavouritesImpl({required this.favouritesId});

  @override
  final String favouritesId;

  @override
  String toString() {
    return 'RemoveItemFavouritesEvent.added(favouritesId: $favouritesId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveItemFavouritesImpl &&
            (identical(other.favouritesId, favouritesId) ||
                other.favouritesId == favouritesId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, favouritesId);

  /// Create a copy of RemoveItemFavouritesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveItemFavouritesImplCopyWith<_$RemoveItemFavouritesImpl>
      get copyWith =>
          __$$RemoveItemFavouritesImplCopyWithImpl<_$RemoveItemFavouritesImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String favouritesId) added,
  }) {
    return added(favouritesId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String favouritesId)? added,
  }) {
    return added?.call(favouritesId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String favouritesId)? added,
    required TResult orElse(),
  }) {
    if (added != null) {
      return added(favouritesId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_RemoveItemFavourites value) added,
  }) {
    return added(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_RemoveItemFavourites value)? added,
  }) {
    return added?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_RemoveItemFavourites value)? added,
    required TResult orElse(),
  }) {
    if (added != null) {
      return added(this);
    }
    return orElse();
  }
}

abstract class _RemoveItemFavourites implements RemoveItemFavouritesEvent {
  const factory _RemoveItemFavourites({required final String favouritesId}) =
      _$RemoveItemFavouritesImpl;

  String get favouritesId;

  /// Create a copy of RemoveItemFavouritesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemoveItemFavouritesImplCopyWith<_$RemoveItemFavouritesImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RemoveItemFavouritesState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String postedfavouritemitemodel) addedSuccess,
    required TResult Function(String error) addedFailure,
    required TResult Function() noInternet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String postedfavouritemitemodel)? addedSuccess,
    TResult? Function(String error)? addedFailure,
    TResult? Function()? noInternet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String postedfavouritemitemodel)? addedSuccess,
    TResult Function(String error)? addedFailure,
    TResult Function()? noInternet,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_RemoveItemItemSuccess value) addedSuccess,
    required TResult Function(_RemoveItemFailure value) addedFailure,
    required TResult Function(_NoInternet value) noInternet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_RemoveItemItemSuccess value)? addedSuccess,
    TResult? Function(_RemoveItemFailure value)? addedFailure,
    TResult? Function(_NoInternet value)? noInternet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_RemoveItemItemSuccess value)? addedSuccess,
    TResult Function(_RemoveItemFailure value)? addedFailure,
    TResult Function(_NoInternet value)? noInternet,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemoveItemFavouritesStateCopyWith<$Res> {
  factory $RemoveItemFavouritesStateCopyWith(RemoveItemFavouritesState value,
          $Res Function(RemoveItemFavouritesState) then) =
      _$RemoveItemFavouritesStateCopyWithImpl<$Res, RemoveItemFavouritesState>;
}

/// @nodoc
class _$RemoveItemFavouritesStateCopyWithImpl<$Res,
        $Val extends RemoveItemFavouritesState>
    implements $RemoveItemFavouritesStateCopyWith<$Res> {
  _$RemoveItemFavouritesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RemoveItemFavouritesState
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
    extends _$RemoveItemFavouritesStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of RemoveItemFavouritesState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'RemoveItemFavouritesState.initial()';
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
    required TResult Function(String postedfavouritemitemodel) addedSuccess,
    required TResult Function(String error) addedFailure,
    required TResult Function() noInternet,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String postedfavouritemitemodel)? addedSuccess,
    TResult? Function(String error)? addedFailure,
    TResult? Function()? noInternet,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String postedfavouritemitemodel)? addedSuccess,
    TResult Function(String error)? addedFailure,
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
    required TResult Function(_RemoveItemItemSuccess value) addedSuccess,
    required TResult Function(_RemoveItemFailure value) addedFailure,
    required TResult Function(_NoInternet value) noInternet,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_RemoveItemItemSuccess value)? addedSuccess,
    TResult? Function(_RemoveItemFailure value)? addedFailure,
    TResult? Function(_NoInternet value)? noInternet,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_RemoveItemItemSuccess value)? addedSuccess,
    TResult Function(_RemoveItemFailure value)? addedFailure,
    TResult Function(_NoInternet value)? noInternet,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements RemoveItemFavouritesState {
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
    extends _$RemoveItemFavouritesStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of RemoveItemFavouritesState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'RemoveItemFavouritesState.loading()';
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
    required TResult Function(String postedfavouritemitemodel) addedSuccess,
    required TResult Function(String error) addedFailure,
    required TResult Function() noInternet,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String postedfavouritemitemodel)? addedSuccess,
    TResult? Function(String error)? addedFailure,
    TResult? Function()? noInternet,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String postedfavouritemitemodel)? addedSuccess,
    TResult Function(String error)? addedFailure,
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
    required TResult Function(_RemoveItemItemSuccess value) addedSuccess,
    required TResult Function(_RemoveItemFailure value) addedFailure,
    required TResult Function(_NoInternet value) noInternet,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_RemoveItemItemSuccess value)? addedSuccess,
    TResult? Function(_RemoveItemFailure value)? addedFailure,
    TResult? Function(_NoInternet value)? noInternet,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_RemoveItemItemSuccess value)? addedSuccess,
    TResult Function(_RemoveItemFailure value)? addedFailure,
    TResult Function(_NoInternet value)? noInternet,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements RemoveItemFavouritesState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$RemoveItemItemSuccessImplCopyWith<$Res> {
  factory _$$RemoveItemItemSuccessImplCopyWith(
          _$RemoveItemItemSuccessImpl value,
          $Res Function(_$RemoveItemItemSuccessImpl) then) =
      __$$RemoveItemItemSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String postedfavouritemitemodel});
}

/// @nodoc
class __$$RemoveItemItemSuccessImplCopyWithImpl<$Res>
    extends _$RemoveItemFavouritesStateCopyWithImpl<$Res,
        _$RemoveItemItemSuccessImpl>
    implements _$$RemoveItemItemSuccessImplCopyWith<$Res> {
  __$$RemoveItemItemSuccessImplCopyWithImpl(_$RemoveItemItemSuccessImpl _value,
      $Res Function(_$RemoveItemItemSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of RemoveItemFavouritesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postedfavouritemitemodel = null,
  }) {
    return _then(_$RemoveItemItemSuccessImpl(
      postedfavouritemitemodel: null == postedfavouritemitemodel
          ? _value.postedfavouritemitemodel
          : postedfavouritemitemodel // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RemoveItemItemSuccessImpl implements _RemoveItemItemSuccess {
  const _$RemoveItemItemSuccessImpl({required this.postedfavouritemitemodel});

  @override
  final String postedfavouritemitemodel;

  @override
  String toString() {
    return 'RemoveItemFavouritesState.addedSuccess(postedfavouritemitemodel: $postedfavouritemitemodel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveItemItemSuccessImpl &&
            (identical(
                    other.postedfavouritemitemodel, postedfavouritemitemodel) ||
                other.postedfavouritemitemodel == postedfavouritemitemodel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, postedfavouritemitemodel);

  /// Create a copy of RemoveItemFavouritesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveItemItemSuccessImplCopyWith<_$RemoveItemItemSuccessImpl>
      get copyWith => __$$RemoveItemItemSuccessImplCopyWithImpl<
          _$RemoveItemItemSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String postedfavouritemitemodel) addedSuccess,
    required TResult Function(String error) addedFailure,
    required TResult Function() noInternet,
  }) {
    return addedSuccess(postedfavouritemitemodel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String postedfavouritemitemodel)? addedSuccess,
    TResult? Function(String error)? addedFailure,
    TResult? Function()? noInternet,
  }) {
    return addedSuccess?.call(postedfavouritemitemodel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String postedfavouritemitemodel)? addedSuccess,
    TResult Function(String error)? addedFailure,
    TResult Function()? noInternet,
    required TResult orElse(),
  }) {
    if (addedSuccess != null) {
      return addedSuccess(postedfavouritemitemodel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_RemoveItemItemSuccess value) addedSuccess,
    required TResult Function(_RemoveItemFailure value) addedFailure,
    required TResult Function(_NoInternet value) noInternet,
  }) {
    return addedSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_RemoveItemItemSuccess value)? addedSuccess,
    TResult? Function(_RemoveItemFailure value)? addedFailure,
    TResult? Function(_NoInternet value)? noInternet,
  }) {
    return addedSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_RemoveItemItemSuccess value)? addedSuccess,
    TResult Function(_RemoveItemFailure value)? addedFailure,
    TResult Function(_NoInternet value)? noInternet,
    required TResult orElse(),
  }) {
    if (addedSuccess != null) {
      return addedSuccess(this);
    }
    return orElse();
  }
}

abstract class _RemoveItemItemSuccess implements RemoveItemFavouritesState {
  const factory _RemoveItemItemSuccess(
          {required final String postedfavouritemitemodel}) =
      _$RemoveItemItemSuccessImpl;

  String get postedfavouritemitemodel;

  /// Create a copy of RemoveItemFavouritesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemoveItemItemSuccessImplCopyWith<_$RemoveItemItemSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveItemFailureImplCopyWith<$Res> {
  factory _$$RemoveItemFailureImplCopyWith(_$RemoveItemFailureImpl value,
          $Res Function(_$RemoveItemFailureImpl) then) =
      __$$RemoveItemFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$RemoveItemFailureImplCopyWithImpl<$Res>
    extends _$RemoveItemFavouritesStateCopyWithImpl<$Res,
        _$RemoveItemFailureImpl>
    implements _$$RemoveItemFailureImplCopyWith<$Res> {
  __$$RemoveItemFailureImplCopyWithImpl(_$RemoveItemFailureImpl _value,
      $Res Function(_$RemoveItemFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of RemoveItemFavouritesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$RemoveItemFailureImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RemoveItemFailureImpl implements _RemoveItemFailure {
  const _$RemoveItemFailureImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'RemoveItemFavouritesState.addedFailure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveItemFailureImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of RemoveItemFavouritesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveItemFailureImplCopyWith<_$RemoveItemFailureImpl> get copyWith =>
      __$$RemoveItemFailureImplCopyWithImpl<_$RemoveItemFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String postedfavouritemitemodel) addedSuccess,
    required TResult Function(String error) addedFailure,
    required TResult Function() noInternet,
  }) {
    return addedFailure(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String postedfavouritemitemodel)? addedSuccess,
    TResult? Function(String error)? addedFailure,
    TResult? Function()? noInternet,
  }) {
    return addedFailure?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String postedfavouritemitemodel)? addedSuccess,
    TResult Function(String error)? addedFailure,
    TResult Function()? noInternet,
    required TResult orElse(),
  }) {
    if (addedFailure != null) {
      return addedFailure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_RemoveItemItemSuccess value) addedSuccess,
    required TResult Function(_RemoveItemFailure value) addedFailure,
    required TResult Function(_NoInternet value) noInternet,
  }) {
    return addedFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_RemoveItemItemSuccess value)? addedSuccess,
    TResult? Function(_RemoveItemFailure value)? addedFailure,
    TResult? Function(_NoInternet value)? noInternet,
  }) {
    return addedFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_RemoveItemItemSuccess value)? addedSuccess,
    TResult Function(_RemoveItemFailure value)? addedFailure,
    TResult Function(_NoInternet value)? noInternet,
    required TResult orElse(),
  }) {
    if (addedFailure != null) {
      return addedFailure(this);
    }
    return orElse();
  }
}

abstract class _RemoveItemFailure implements RemoveItemFavouritesState {
  const factory _RemoveItemFailure({required final String error}) =
      _$RemoveItemFailureImpl;

  String get error;

  /// Create a copy of RemoveItemFavouritesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemoveItemFailureImplCopyWith<_$RemoveItemFailureImpl> get copyWith =>
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
    extends _$RemoveItemFavouritesStateCopyWithImpl<$Res, _$NoInternetImpl>
    implements _$$NoInternetImplCopyWith<$Res> {
  __$$NoInternetImplCopyWithImpl(
      _$NoInternetImpl _value, $Res Function(_$NoInternetImpl) _then)
      : super(_value, _then);

  /// Create a copy of RemoveItemFavouritesState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$NoInternetImpl implements _NoInternet {
  const _$NoInternetImpl();

  @override
  String toString() {
    return 'RemoveItemFavouritesState.noInternet()';
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
    required TResult Function(String postedfavouritemitemodel) addedSuccess,
    required TResult Function(String error) addedFailure,
    required TResult Function() noInternet,
  }) {
    return noInternet();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String postedfavouritemitemodel)? addedSuccess,
    TResult? Function(String error)? addedFailure,
    TResult? Function()? noInternet,
  }) {
    return noInternet?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String postedfavouritemitemodel)? addedSuccess,
    TResult Function(String error)? addedFailure,
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
    required TResult Function(_RemoveItemItemSuccess value) addedSuccess,
    required TResult Function(_RemoveItemFailure value) addedFailure,
    required TResult Function(_NoInternet value) noInternet,
  }) {
    return noInternet(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_RemoveItemItemSuccess value)? addedSuccess,
    TResult? Function(_RemoveItemFailure value)? addedFailure,
    TResult? Function(_NoInternet value)? noInternet,
  }) {
    return noInternet?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_RemoveItemItemSuccess value)? addedSuccess,
    TResult Function(_RemoveItemFailure value)? addedFailure,
    TResult Function(_NoInternet value)? noInternet,
    required TResult orElse(),
  }) {
    if (noInternet != null) {
      return noInternet(this);
    }
    return orElse();
  }
}

abstract class _NoInternet implements RemoveItemFavouritesState {
  const factory _NoInternet() = _$NoInternetImpl;
}
