// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_user_profile_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UpdateUserProfileEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(
            String? name, String? email, String? phone, String? image)
        updateprofile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(
            String? name, String? email, String? phone, String? image)?
        updateprofile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String? name, String? email, String? phone, String? image)?
        updateprofile,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_RemoveItemFavourites value) updateprofile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_RemoveItemFavourites value)? updateprofile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_RemoveItemFavourites value)? updateprofile,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateUserProfileEventCopyWith<$Res> {
  factory $UpdateUserProfileEventCopyWith(UpdateUserProfileEvent value,
          $Res Function(UpdateUserProfileEvent) then) =
      _$UpdateUserProfileEventCopyWithImpl<$Res, UpdateUserProfileEvent>;
}

/// @nodoc
class _$UpdateUserProfileEventCopyWithImpl<$Res,
        $Val extends UpdateUserProfileEvent>
    implements $UpdateUserProfileEventCopyWith<$Res> {
  _$UpdateUserProfileEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateUserProfileEvent
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
    extends _$UpdateUserProfileEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateUserProfileEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'UpdateUserProfileEvent.started()';
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
    required TResult Function(
            String? name, String? email, String? phone, String? image)
        updateprofile,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(
            String? name, String? email, String? phone, String? image)?
        updateprofile,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String? name, String? email, String? phone, String? image)?
        updateprofile,
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
    required TResult Function(_RemoveItemFavourites value) updateprofile,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_RemoveItemFavourites value)? updateprofile,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_RemoveItemFavourites value)? updateprofile,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements UpdateUserProfileEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$RemoveItemFavouritesImplCopyWith<$Res> {
  factory _$$RemoveItemFavouritesImplCopyWith(_$RemoveItemFavouritesImpl value,
          $Res Function(_$RemoveItemFavouritesImpl) then) =
      __$$RemoveItemFavouritesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? name, String? email, String? phone, String? image});
}

/// @nodoc
class __$$RemoveItemFavouritesImplCopyWithImpl<$Res>
    extends _$UpdateUserProfileEventCopyWithImpl<$Res,
        _$RemoveItemFavouritesImpl>
    implements _$$RemoveItemFavouritesImplCopyWith<$Res> {
  __$$RemoveItemFavouritesImplCopyWithImpl(_$RemoveItemFavouritesImpl _value,
      $Res Function(_$RemoveItemFavouritesImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateUserProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? image = freezed,
  }) {
    return _then(_$RemoveItemFavouritesImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$RemoveItemFavouritesImpl implements _RemoveItemFavourites {
  const _$RemoveItemFavouritesImpl(
      {this.name, this.email, this.phone, this.image});

  @override
  final String? name;
  @override
  final String? email;
  @override
  final String? phone;
  @override
  final String? image;

  @override
  String toString() {
    return 'UpdateUserProfileEvent.updateprofile(name: $name, email: $email, phone: $phone, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveItemFavouritesImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.image, image) || other.image == image));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, email, phone, image);

  /// Create a copy of UpdateUserProfileEvent
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
    required TResult Function(
            String? name, String? email, String? phone, String? image)
        updateprofile,
  }) {
    return updateprofile(name, email, phone, image);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(
            String? name, String? email, String? phone, String? image)?
        updateprofile,
  }) {
    return updateprofile?.call(name, email, phone, image);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String? name, String? email, String? phone, String? image)?
        updateprofile,
    required TResult orElse(),
  }) {
    if (updateprofile != null) {
      return updateprofile(name, email, phone, image);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_RemoveItemFavourites value) updateprofile,
  }) {
    return updateprofile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_RemoveItemFavourites value)? updateprofile,
  }) {
    return updateprofile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_RemoveItemFavourites value)? updateprofile,
    required TResult orElse(),
  }) {
    if (updateprofile != null) {
      return updateprofile(this);
    }
    return orElse();
  }
}

abstract class _RemoveItemFavourites implements UpdateUserProfileEvent {
  const factory _RemoveItemFavourites(
      {final String? name,
      final String? email,
      final String? phone,
      final String? image}) = _$RemoveItemFavouritesImpl;

  String? get name;
  String? get email;
  String? get phone;
  String? get image;

  /// Create a copy of UpdateUserProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemoveItemFavouritesImplCopyWith<_$RemoveItemFavouritesImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UpdateUserProfileState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserUpdateSuccesModel updateuser) updateuser,
    required TResult Function(String error) updateFailure,
    required TResult Function() noInternet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserUpdateSuccesModel updateuser)? updateuser,
    TResult? Function(String error)? updateFailure,
    TResult? Function()? noInternet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserUpdateSuccesModel updateuser)? updateuser,
    TResult Function(String error)? updateFailure,
    TResult Function()? noInternet,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Updateuser value) updateuser,
    required TResult Function(_RemoveItemFailure value) updateFailure,
    required TResult Function(_NoInternet value) noInternet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Updateuser value)? updateuser,
    TResult? Function(_RemoveItemFailure value)? updateFailure,
    TResult? Function(_NoInternet value)? noInternet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Updateuser value)? updateuser,
    TResult Function(_RemoveItemFailure value)? updateFailure,
    TResult Function(_NoInternet value)? noInternet,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateUserProfileStateCopyWith<$Res> {
  factory $UpdateUserProfileStateCopyWith(UpdateUserProfileState value,
          $Res Function(UpdateUserProfileState) then) =
      _$UpdateUserProfileStateCopyWithImpl<$Res, UpdateUserProfileState>;
}

/// @nodoc
class _$UpdateUserProfileStateCopyWithImpl<$Res,
        $Val extends UpdateUserProfileState>
    implements $UpdateUserProfileStateCopyWith<$Res> {
  _$UpdateUserProfileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateUserProfileState
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
    extends _$UpdateUserProfileStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateUserProfileState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'UpdateUserProfileState.initial()';
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
    required TResult Function(UserUpdateSuccesModel updateuser) updateuser,
    required TResult Function(String error) updateFailure,
    required TResult Function() noInternet,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserUpdateSuccesModel updateuser)? updateuser,
    TResult? Function(String error)? updateFailure,
    TResult? Function()? noInternet,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserUpdateSuccesModel updateuser)? updateuser,
    TResult Function(String error)? updateFailure,
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
    required TResult Function(_Updateuser value) updateuser,
    required TResult Function(_RemoveItemFailure value) updateFailure,
    required TResult Function(_NoInternet value) noInternet,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Updateuser value)? updateuser,
    TResult? Function(_RemoveItemFailure value)? updateFailure,
    TResult? Function(_NoInternet value)? noInternet,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Updateuser value)? updateuser,
    TResult Function(_RemoveItemFailure value)? updateFailure,
    TResult Function(_NoInternet value)? noInternet,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements UpdateUserProfileState {
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
    extends _$UpdateUserProfileStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateUserProfileState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'UpdateUserProfileState.loading()';
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
    required TResult Function(UserUpdateSuccesModel updateuser) updateuser,
    required TResult Function(String error) updateFailure,
    required TResult Function() noInternet,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserUpdateSuccesModel updateuser)? updateuser,
    TResult? Function(String error)? updateFailure,
    TResult? Function()? noInternet,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserUpdateSuccesModel updateuser)? updateuser,
    TResult Function(String error)? updateFailure,
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
    required TResult Function(_Updateuser value) updateuser,
    required TResult Function(_RemoveItemFailure value) updateFailure,
    required TResult Function(_NoInternet value) noInternet,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Updateuser value)? updateuser,
    TResult? Function(_RemoveItemFailure value)? updateFailure,
    TResult? Function(_NoInternet value)? noInternet,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Updateuser value)? updateuser,
    TResult Function(_RemoveItemFailure value)? updateFailure,
    TResult Function(_NoInternet value)? noInternet,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements UpdateUserProfileState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$UpdateuserImplCopyWith<$Res> {
  factory _$$UpdateuserImplCopyWith(
          _$UpdateuserImpl value, $Res Function(_$UpdateuserImpl) then) =
      __$$UpdateuserImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserUpdateSuccesModel updateuser});
}

/// @nodoc
class __$$UpdateuserImplCopyWithImpl<$Res>
    extends _$UpdateUserProfileStateCopyWithImpl<$Res, _$UpdateuserImpl>
    implements _$$UpdateuserImplCopyWith<$Res> {
  __$$UpdateuserImplCopyWithImpl(
      _$UpdateuserImpl _value, $Res Function(_$UpdateuserImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateUserProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? updateuser = null,
  }) {
    return _then(_$UpdateuserImpl(
      updateuser: null == updateuser
          ? _value.updateuser
          : updateuser // ignore: cast_nullable_to_non_nullable
              as UserUpdateSuccesModel,
    ));
  }
}

/// @nodoc

class _$UpdateuserImpl implements _Updateuser {
  const _$UpdateuserImpl({required this.updateuser});

  @override
  final UserUpdateSuccesModel updateuser;

  @override
  String toString() {
    return 'UpdateUserProfileState.updateuser(updateuser: $updateuser)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateuserImpl &&
            (identical(other.updateuser, updateuser) ||
                other.updateuser == updateuser));
  }

  @override
  int get hashCode => Object.hash(runtimeType, updateuser);

  /// Create a copy of UpdateUserProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateuserImplCopyWith<_$UpdateuserImpl> get copyWith =>
      __$$UpdateuserImplCopyWithImpl<_$UpdateuserImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserUpdateSuccesModel updateuser) updateuser,
    required TResult Function(String error) updateFailure,
    required TResult Function() noInternet,
  }) {
    return updateuser(this.updateuser);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserUpdateSuccesModel updateuser)? updateuser,
    TResult? Function(String error)? updateFailure,
    TResult? Function()? noInternet,
  }) {
    return updateuser?.call(this.updateuser);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserUpdateSuccesModel updateuser)? updateuser,
    TResult Function(String error)? updateFailure,
    TResult Function()? noInternet,
    required TResult orElse(),
  }) {
    if (updateuser != null) {
      return updateuser(this.updateuser);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Updateuser value) updateuser,
    required TResult Function(_RemoveItemFailure value) updateFailure,
    required TResult Function(_NoInternet value) noInternet,
  }) {
    return updateuser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Updateuser value)? updateuser,
    TResult? Function(_RemoveItemFailure value)? updateFailure,
    TResult? Function(_NoInternet value)? noInternet,
  }) {
    return updateuser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Updateuser value)? updateuser,
    TResult Function(_RemoveItemFailure value)? updateFailure,
    TResult Function(_NoInternet value)? noInternet,
    required TResult orElse(),
  }) {
    if (updateuser != null) {
      return updateuser(this);
    }
    return orElse();
  }
}

abstract class _Updateuser implements UpdateUserProfileState {
  const factory _Updateuser({required final UserUpdateSuccesModel updateuser}) =
      _$UpdateuserImpl;

  UserUpdateSuccesModel get updateuser;

  /// Create a copy of UpdateUserProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateuserImplCopyWith<_$UpdateuserImpl> get copyWith =>
      throw _privateConstructorUsedError;
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
    extends _$UpdateUserProfileStateCopyWithImpl<$Res, _$RemoveItemFailureImpl>
    implements _$$RemoveItemFailureImplCopyWith<$Res> {
  __$$RemoveItemFailureImplCopyWithImpl(_$RemoveItemFailureImpl _value,
      $Res Function(_$RemoveItemFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateUserProfileState
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
    return 'UpdateUserProfileState.updateFailure(error: $error)';
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

  /// Create a copy of UpdateUserProfileState
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
    required TResult Function(UserUpdateSuccesModel updateuser) updateuser,
    required TResult Function(String error) updateFailure,
    required TResult Function() noInternet,
  }) {
    return updateFailure(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserUpdateSuccesModel updateuser)? updateuser,
    TResult? Function(String error)? updateFailure,
    TResult? Function()? noInternet,
  }) {
    return updateFailure?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserUpdateSuccesModel updateuser)? updateuser,
    TResult Function(String error)? updateFailure,
    TResult Function()? noInternet,
    required TResult orElse(),
  }) {
    if (updateFailure != null) {
      return updateFailure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Updateuser value) updateuser,
    required TResult Function(_RemoveItemFailure value) updateFailure,
    required TResult Function(_NoInternet value) noInternet,
  }) {
    return updateFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Updateuser value)? updateuser,
    TResult? Function(_RemoveItemFailure value)? updateFailure,
    TResult? Function(_NoInternet value)? noInternet,
  }) {
    return updateFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Updateuser value)? updateuser,
    TResult Function(_RemoveItemFailure value)? updateFailure,
    TResult Function(_NoInternet value)? noInternet,
    required TResult orElse(),
  }) {
    if (updateFailure != null) {
      return updateFailure(this);
    }
    return orElse();
  }
}

abstract class _RemoveItemFailure implements UpdateUserProfileState {
  const factory _RemoveItemFailure({required final String error}) =
      _$RemoveItemFailureImpl;

  String get error;

  /// Create a copy of UpdateUserProfileState
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
    extends _$UpdateUserProfileStateCopyWithImpl<$Res, _$NoInternetImpl>
    implements _$$NoInternetImplCopyWith<$Res> {
  __$$NoInternetImplCopyWithImpl(
      _$NoInternetImpl _value, $Res Function(_$NoInternetImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateUserProfileState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$NoInternetImpl implements _NoInternet {
  const _$NoInternetImpl();

  @override
  String toString() {
    return 'UpdateUserProfileState.noInternet()';
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
    required TResult Function(UserUpdateSuccesModel updateuser) updateuser,
    required TResult Function(String error) updateFailure,
    required TResult Function() noInternet,
  }) {
    return noInternet();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserUpdateSuccesModel updateuser)? updateuser,
    TResult? Function(String error)? updateFailure,
    TResult? Function()? noInternet,
  }) {
    return noInternet?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserUpdateSuccesModel updateuser)? updateuser,
    TResult Function(String error)? updateFailure,
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
    required TResult Function(_Updateuser value) updateuser,
    required TResult Function(_RemoveItemFailure value) updateFailure,
    required TResult Function(_NoInternet value) noInternet,
  }) {
    return noInternet(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Updateuser value)? updateuser,
    TResult? Function(_RemoveItemFailure value)? updateFailure,
    TResult? Function(_NoInternet value)? noInternet,
  }) {
    return noInternet?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Updateuser value)? updateuser,
    TResult Function(_RemoveItemFailure value)? updateFailure,
    TResult Function(_NoInternet value)? noInternet,
    required TResult orElse(),
  }) {
    if (noInternet != null) {
      return noInternet(this);
    }
    return orElse();
  }
}

abstract class _NoInternet implements UpdateUserProfileState {
  const factory _NoInternet() = _$NoInternetImpl;
}
