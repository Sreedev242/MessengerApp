// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_name_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProfileNameEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileNameEventCopyWith<$Res> {
  factory $ProfileNameEventCopyWith(
          ProfileNameEvent value, $Res Function(ProfileNameEvent) then) =
      _$ProfileNameEventCopyWithImpl<$Res, ProfileNameEvent>;
}

/// @nodoc
class _$ProfileNameEventCopyWithImpl<$Res, $Val extends ProfileNameEvent>
    implements $ProfileNameEventCopyWith<$Res> {
  _$ProfileNameEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_StartedCopyWith<$Res> {
  factory _$$_StartedCopyWith(
          _$_Started value, $Res Function(_$_Started) then) =
      __$$_StartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_StartedCopyWithImpl<$Res>
    extends _$ProfileNameEventCopyWithImpl<$Res, _$_Started>
    implements _$$_StartedCopyWith<$Res> {
  __$$_StartedCopyWithImpl(_$_Started _value, $Res Function(_$_Started) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Started implements _Started {
  const _$_Started();

  @override
  String toString() {
    return 'ProfileNameEvent.started()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Started);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
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
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements ProfileNameEvent {
  const factory _Started() = _$_Started;
}

/// @nodoc
mixin _$ProfileNameState {
  String get profile_name => throw _privateConstructorUsedError;
  String get profile_email => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfileNameStateCopyWith<ProfileNameState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileNameStateCopyWith<$Res> {
  factory $ProfileNameStateCopyWith(
          ProfileNameState value, $Res Function(ProfileNameState) then) =
      _$ProfileNameStateCopyWithImpl<$Res, ProfileNameState>;
  @useResult
  $Res call({String profile_name, String profile_email});
}

/// @nodoc
class _$ProfileNameStateCopyWithImpl<$Res, $Val extends ProfileNameState>
    implements $ProfileNameStateCopyWith<$Res> {
  _$ProfileNameStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profile_name = null,
    Object? profile_email = null,
  }) {
    return _then(_value.copyWith(
      profile_name: null == profile_name
          ? _value.profile_name
          : profile_name // ignore: cast_nullable_to_non_nullable
              as String,
      profile_email: null == profile_email
          ? _value.profile_email
          : profile_email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res>
    implements $ProfileNameStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String profile_name, String profile_email});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$ProfileNameStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profile_name = null,
    Object? profile_email = null,
  }) {
    return _then(_$_Initial(
      profile_name: null == profile_name
          ? _value.profile_name
          : profile_name // ignore: cast_nullable_to_non_nullable
              as String,
      profile_email: null == profile_email
          ? _value.profile_email
          : profile_email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial({required this.profile_name, required this.profile_email});

  @override
  final String profile_name;
  @override
  final String profile_email;

  @override
  String toString() {
    return 'ProfileNameState(profile_name: $profile_name, profile_email: $profile_email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            (identical(other.profile_name, profile_name) ||
                other.profile_name == profile_name) &&
            (identical(other.profile_email, profile_email) ||
                other.profile_email == profile_email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profile_name, profile_email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);
}

abstract class _Initial implements ProfileNameState {
  const factory _Initial(
      {required final String profile_name,
      required final String profile_email}) = _$_Initial;

  @override
  String get profile_name;
  @override
  String get profile_email;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
