// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_google_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PostGoogleEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String UId, String name) added,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String UId, String name)? added,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String UId, String name)? added,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_PostGoogle value) added,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_PostGoogle value)? added,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_PostGoogle value)? added,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostGoogleEventCopyWith<$Res> {
  factory $PostGoogleEventCopyWith(
          PostGoogleEvent value, $Res Function(PostGoogleEvent) then) =
      _$PostGoogleEventCopyWithImpl<$Res, PostGoogleEvent>;
}

/// @nodoc
class _$PostGoogleEventCopyWithImpl<$Res, $Val extends PostGoogleEvent>
    implements $PostGoogleEventCopyWith<$Res> {
  _$PostGoogleEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PostGoogleEvent
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
    extends _$PostGoogleEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of PostGoogleEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'PostGoogleEvent.started()';
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
    required TResult Function(String UId, String name) added,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String UId, String name)? added,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String UId, String name)? added,
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
    required TResult Function(_PostGoogle value) added,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_PostGoogle value)? added,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_PostGoogle value)? added,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements PostGoogleEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$PostGoogleImplCopyWith<$Res> {
  factory _$$PostGoogleImplCopyWith(
          _$PostGoogleImpl value, $Res Function(_$PostGoogleImpl) then) =
      __$$PostGoogleImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String UId, String name});
}

/// @nodoc
class __$$PostGoogleImplCopyWithImpl<$Res>
    extends _$PostGoogleEventCopyWithImpl<$Res, _$PostGoogleImpl>
    implements _$$PostGoogleImplCopyWith<$Res> {
  __$$PostGoogleImplCopyWithImpl(
      _$PostGoogleImpl _value, $Res Function(_$PostGoogleImpl) _then)
      : super(_value, _then);

  /// Create a copy of PostGoogleEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? UId = null,
    Object? name = null,
  }) {
    return _then(_$PostGoogleImpl(
      UId: null == UId
          ? _value.UId
          : UId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PostGoogleImpl implements _PostGoogle {
  const _$PostGoogleImpl({required this.UId, required this.name});

  @override
  final String UId;
  @override
  final String name;

  @override
  String toString() {
    return 'PostGoogleEvent.added(UId: $UId, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostGoogleImpl &&
            (identical(other.UId, UId) || other.UId == UId) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, UId, name);

  /// Create a copy of PostGoogleEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostGoogleImplCopyWith<_$PostGoogleImpl> get copyWith =>
      __$$PostGoogleImplCopyWithImpl<_$PostGoogleImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String UId, String name) added,
  }) {
    return added(UId, name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String UId, String name)? added,
  }) {
    return added?.call(UId, name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String UId, String name)? added,
    required TResult orElse(),
  }) {
    if (added != null) {
      return added(UId, name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_PostGoogle value) added,
  }) {
    return added(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_PostGoogle value)? added,
  }) {
    return added?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_PostGoogle value)? added,
    required TResult orElse(),
  }) {
    if (added != null) {
      return added(this);
    }
    return orElse();
  }
}

abstract class _PostGoogle implements PostGoogleEvent {
  const factory _PostGoogle(
      {required final String UId,
      required final String name}) = _$PostGoogleImpl;

  String get UId;
  String get name;

  /// Create a copy of PostGoogleEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostGoogleImplCopyWith<_$PostGoogleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PostGoogleState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(VerifiedgoogleIdModel gmailresponse) addedSuccess,
    required TResult Function(String error) addedFailure,
    required TResult Function() noInternet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(VerifiedgoogleIdModel gmailresponse)? addedSuccess,
    TResult? Function(String error)? addedFailure,
    TResult? Function()? noInternet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(VerifiedgoogleIdModel gmailresponse)? addedSuccess,
    TResult Function(String error)? addedFailure,
    TResult Function()? noInternet,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_PostedFavouritemItemSuccess value) addedSuccess,
    required TResult Function(AddItemToFavouritesFailure value) addedFailure,
    required TResult Function(_NoInternet value) noInternet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_PostedFavouritemItemSuccess value)? addedSuccess,
    TResult? Function(AddItemToFavouritesFailure value)? addedFailure,
    TResult? Function(_NoInternet value)? noInternet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_PostedFavouritemItemSuccess value)? addedSuccess,
    TResult Function(AddItemToFavouritesFailure value)? addedFailure,
    TResult Function(_NoInternet value)? noInternet,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostGoogleStateCopyWith<$Res> {
  factory $PostGoogleStateCopyWith(
          PostGoogleState value, $Res Function(PostGoogleState) then) =
      _$PostGoogleStateCopyWithImpl<$Res, PostGoogleState>;
}

/// @nodoc
class _$PostGoogleStateCopyWithImpl<$Res, $Val extends PostGoogleState>
    implements $PostGoogleStateCopyWith<$Res> {
  _$PostGoogleStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PostGoogleState
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
    extends _$PostGoogleStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of PostGoogleState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'PostGoogleState.initial()';
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
    required TResult Function(VerifiedgoogleIdModel gmailresponse) addedSuccess,
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
    TResult? Function(VerifiedgoogleIdModel gmailresponse)? addedSuccess,
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
    TResult Function(VerifiedgoogleIdModel gmailresponse)? addedSuccess,
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
    required TResult Function(_PostedFavouritemItemSuccess value) addedSuccess,
    required TResult Function(AddItemToFavouritesFailure value) addedFailure,
    required TResult Function(_NoInternet value) noInternet,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_PostedFavouritemItemSuccess value)? addedSuccess,
    TResult? Function(AddItemToFavouritesFailure value)? addedFailure,
    TResult? Function(_NoInternet value)? noInternet,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_PostedFavouritemItemSuccess value)? addedSuccess,
    TResult Function(AddItemToFavouritesFailure value)? addedFailure,
    TResult Function(_NoInternet value)? noInternet,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements PostGoogleState {
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
    extends _$PostGoogleStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of PostGoogleState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'PostGoogleState.loading()';
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
    required TResult Function(VerifiedgoogleIdModel gmailresponse) addedSuccess,
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
    TResult? Function(VerifiedgoogleIdModel gmailresponse)? addedSuccess,
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
    TResult Function(VerifiedgoogleIdModel gmailresponse)? addedSuccess,
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
    required TResult Function(_PostedFavouritemItemSuccess value) addedSuccess,
    required TResult Function(AddItemToFavouritesFailure value) addedFailure,
    required TResult Function(_NoInternet value) noInternet,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_PostedFavouritemItemSuccess value)? addedSuccess,
    TResult? Function(AddItemToFavouritesFailure value)? addedFailure,
    TResult? Function(_NoInternet value)? noInternet,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_PostedFavouritemItemSuccess value)? addedSuccess,
    TResult Function(AddItemToFavouritesFailure value)? addedFailure,
    TResult Function(_NoInternet value)? noInternet,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements PostGoogleState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$PostedFavouritemItemSuccessImplCopyWith<$Res> {
  factory _$$PostedFavouritemItemSuccessImplCopyWith(
          _$PostedFavouritemItemSuccessImpl value,
          $Res Function(_$PostedFavouritemItemSuccessImpl) then) =
      __$$PostedFavouritemItemSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({VerifiedgoogleIdModel gmailresponse});
}

/// @nodoc
class __$$PostedFavouritemItemSuccessImplCopyWithImpl<$Res>
    extends _$PostGoogleStateCopyWithImpl<$Res,
        _$PostedFavouritemItemSuccessImpl>
    implements _$$PostedFavouritemItemSuccessImplCopyWith<$Res> {
  __$$PostedFavouritemItemSuccessImplCopyWithImpl(
      _$PostedFavouritemItemSuccessImpl _value,
      $Res Function(_$PostedFavouritemItemSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of PostGoogleState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gmailresponse = null,
  }) {
    return _then(_$PostedFavouritemItemSuccessImpl(
      gmailresponse: null == gmailresponse
          ? _value.gmailresponse
          : gmailresponse // ignore: cast_nullable_to_non_nullable
              as VerifiedgoogleIdModel,
    ));
  }
}

/// @nodoc

class _$PostedFavouritemItemSuccessImpl
    implements _PostedFavouritemItemSuccess {
  const _$PostedFavouritemItemSuccessImpl({required this.gmailresponse});

  @override
  final VerifiedgoogleIdModel gmailresponse;

  @override
  String toString() {
    return 'PostGoogleState.addedSuccess(gmailresponse: $gmailresponse)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostedFavouritemItemSuccessImpl &&
            (identical(other.gmailresponse, gmailresponse) ||
                other.gmailresponse == gmailresponse));
  }

  @override
  int get hashCode => Object.hash(runtimeType, gmailresponse);

  /// Create a copy of PostGoogleState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostedFavouritemItemSuccessImplCopyWith<_$PostedFavouritemItemSuccessImpl>
      get copyWith => __$$PostedFavouritemItemSuccessImplCopyWithImpl<
          _$PostedFavouritemItemSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(VerifiedgoogleIdModel gmailresponse) addedSuccess,
    required TResult Function(String error) addedFailure,
    required TResult Function() noInternet,
  }) {
    return addedSuccess(gmailresponse);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(VerifiedgoogleIdModel gmailresponse)? addedSuccess,
    TResult? Function(String error)? addedFailure,
    TResult? Function()? noInternet,
  }) {
    return addedSuccess?.call(gmailresponse);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(VerifiedgoogleIdModel gmailresponse)? addedSuccess,
    TResult Function(String error)? addedFailure,
    TResult Function()? noInternet,
    required TResult orElse(),
  }) {
    if (addedSuccess != null) {
      return addedSuccess(gmailresponse);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_PostedFavouritemItemSuccess value) addedSuccess,
    required TResult Function(AddItemToFavouritesFailure value) addedFailure,
    required TResult Function(_NoInternet value) noInternet,
  }) {
    return addedSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_PostedFavouritemItemSuccess value)? addedSuccess,
    TResult? Function(AddItemToFavouritesFailure value)? addedFailure,
    TResult? Function(_NoInternet value)? noInternet,
  }) {
    return addedSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_PostedFavouritemItemSuccess value)? addedSuccess,
    TResult Function(AddItemToFavouritesFailure value)? addedFailure,
    TResult Function(_NoInternet value)? noInternet,
    required TResult orElse(),
  }) {
    if (addedSuccess != null) {
      return addedSuccess(this);
    }
    return orElse();
  }
}

abstract class _PostedFavouritemItemSuccess implements PostGoogleState {
  const factory _PostedFavouritemItemSuccess(
          {required final VerifiedgoogleIdModel gmailresponse}) =
      _$PostedFavouritemItemSuccessImpl;

  VerifiedgoogleIdModel get gmailresponse;

  /// Create a copy of PostGoogleState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostedFavouritemItemSuccessImplCopyWith<_$PostedFavouritemItemSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddItemToFavouritesFailureImplCopyWith<$Res> {
  factory _$$AddItemToFavouritesFailureImplCopyWith(
          _$AddItemToFavouritesFailureImpl value,
          $Res Function(_$AddItemToFavouritesFailureImpl) then) =
      __$$AddItemToFavouritesFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$AddItemToFavouritesFailureImplCopyWithImpl<$Res>
    extends _$PostGoogleStateCopyWithImpl<$Res,
        _$AddItemToFavouritesFailureImpl>
    implements _$$AddItemToFavouritesFailureImplCopyWith<$Res> {
  __$$AddItemToFavouritesFailureImplCopyWithImpl(
      _$AddItemToFavouritesFailureImpl _value,
      $Res Function(_$AddItemToFavouritesFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of PostGoogleState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$AddItemToFavouritesFailureImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AddItemToFavouritesFailureImpl implements AddItemToFavouritesFailure {
  const _$AddItemToFavouritesFailureImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'PostGoogleState.addedFailure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddItemToFavouritesFailureImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of PostGoogleState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddItemToFavouritesFailureImplCopyWith<_$AddItemToFavouritesFailureImpl>
      get copyWith => __$$AddItemToFavouritesFailureImplCopyWithImpl<
          _$AddItemToFavouritesFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(VerifiedgoogleIdModel gmailresponse) addedSuccess,
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
    TResult? Function(VerifiedgoogleIdModel gmailresponse)? addedSuccess,
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
    TResult Function(VerifiedgoogleIdModel gmailresponse)? addedSuccess,
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
    required TResult Function(_PostedFavouritemItemSuccess value) addedSuccess,
    required TResult Function(AddItemToFavouritesFailure value) addedFailure,
    required TResult Function(_NoInternet value) noInternet,
  }) {
    return addedFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_PostedFavouritemItemSuccess value)? addedSuccess,
    TResult? Function(AddItemToFavouritesFailure value)? addedFailure,
    TResult? Function(_NoInternet value)? noInternet,
  }) {
    return addedFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_PostedFavouritemItemSuccess value)? addedSuccess,
    TResult Function(AddItemToFavouritesFailure value)? addedFailure,
    TResult Function(_NoInternet value)? noInternet,
    required TResult orElse(),
  }) {
    if (addedFailure != null) {
      return addedFailure(this);
    }
    return orElse();
  }
}

abstract class AddItemToFavouritesFailure implements PostGoogleState {
  const factory AddItemToFavouritesFailure({required final String error}) =
      _$AddItemToFavouritesFailureImpl;

  String get error;

  /// Create a copy of PostGoogleState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddItemToFavouritesFailureImplCopyWith<_$AddItemToFavouritesFailureImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NoInternetImplCopyWith<$Res> {
  factory _$$NoInternetImplCopyWith(
          _$NoInternetImpl value, $Res Function(_$NoInternetImpl) then) =
      __$$NoInternetImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NoInternetImplCopyWithImpl<$Res>
    extends _$PostGoogleStateCopyWithImpl<$Res, _$NoInternetImpl>
    implements _$$NoInternetImplCopyWith<$Res> {
  __$$NoInternetImplCopyWithImpl(
      _$NoInternetImpl _value, $Res Function(_$NoInternetImpl) _then)
      : super(_value, _then);

  /// Create a copy of PostGoogleState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$NoInternetImpl implements _NoInternet {
  const _$NoInternetImpl();

  @override
  String toString() {
    return 'PostGoogleState.noInternet()';
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
    required TResult Function(VerifiedgoogleIdModel gmailresponse) addedSuccess,
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
    TResult? Function(VerifiedgoogleIdModel gmailresponse)? addedSuccess,
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
    TResult Function(VerifiedgoogleIdModel gmailresponse)? addedSuccess,
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
    required TResult Function(_PostedFavouritemItemSuccess value) addedSuccess,
    required TResult Function(AddItemToFavouritesFailure value) addedFailure,
    required TResult Function(_NoInternet value) noInternet,
  }) {
    return noInternet(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_PostedFavouritemItemSuccess value)? addedSuccess,
    TResult? Function(AddItemToFavouritesFailure value)? addedFailure,
    TResult? Function(_NoInternet value)? noInternet,
  }) {
    return noInternet?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_PostedFavouritemItemSuccess value)? addedSuccess,
    TResult Function(AddItemToFavouritesFailure value)? addedFailure,
    TResult Function(_NoInternet value)? noInternet,
    required TResult orElse(),
  }) {
    if (noInternet != null) {
      return noInternet(this);
    }
    return orElse();
  }
}

abstract class _NoInternet implements PostGoogleState {
  const factory _NoInternet() = _$NoInternetImpl;
}
