// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'group_search_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GroupSearchEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String groupName) started,
    required TResult Function() checkJoined,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String groupName)? started,
    TResult? Function()? checkJoined,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String groupName)? started,
    TResult Function()? checkJoined,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_CheckJoined value) checkJoined,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_CheckJoined value)? checkJoined,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_CheckJoined value)? checkJoined,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupSearchEventCopyWith<$Res> {
  factory $GroupSearchEventCopyWith(
          GroupSearchEvent value, $Res Function(GroupSearchEvent) then) =
      _$GroupSearchEventCopyWithImpl<$Res, GroupSearchEvent>;
}

/// @nodoc
class _$GroupSearchEventCopyWithImpl<$Res, $Val extends GroupSearchEvent>
    implements $GroupSearchEventCopyWith<$Res> {
  _$GroupSearchEventCopyWithImpl(this._value, this._then);

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
  @useResult
  $Res call({String groupName});
}

/// @nodoc
class __$$_StartedCopyWithImpl<$Res>
    extends _$GroupSearchEventCopyWithImpl<$Res, _$_Started>
    implements _$$_StartedCopyWith<$Res> {
  __$$_StartedCopyWithImpl(_$_Started _value, $Res Function(_$_Started) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groupName = null,
  }) {
    return _then(_$_Started(
      groupName: null == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Started with DiagnosticableTreeMixin implements _Started {
  const _$_Started({required this.groupName});

  @override
  final String groupName;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GroupSearchEvent.started(groupName: $groupName)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GroupSearchEvent.started'))
      ..add(DiagnosticsProperty('groupName', groupName));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Started &&
            (identical(other.groupName, groupName) ||
                other.groupName == groupName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, groupName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StartedCopyWith<_$_Started> get copyWith =>
      __$$_StartedCopyWithImpl<_$_Started>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String groupName) started,
    required TResult Function() checkJoined,
  }) {
    return started(groupName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String groupName)? started,
    TResult? Function()? checkJoined,
  }) {
    return started?.call(groupName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String groupName)? started,
    TResult Function()? checkJoined,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(groupName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_CheckJoined value) checkJoined,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_CheckJoined value)? checkJoined,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_CheckJoined value)? checkJoined,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements GroupSearchEvent {
  const factory _Started({required final String groupName}) = _$_Started;

  String get groupName;
  @JsonKey(ignore: true)
  _$$_StartedCopyWith<_$_Started> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_CheckJoinedCopyWith<$Res> {
  factory _$$_CheckJoinedCopyWith(
          _$_CheckJoined value, $Res Function(_$_CheckJoined) then) =
      __$$_CheckJoinedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_CheckJoinedCopyWithImpl<$Res>
    extends _$GroupSearchEventCopyWithImpl<$Res, _$_CheckJoined>
    implements _$$_CheckJoinedCopyWith<$Res> {
  __$$_CheckJoinedCopyWithImpl(
      _$_CheckJoined _value, $Res Function(_$_CheckJoined) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_CheckJoined with DiagnosticableTreeMixin implements _CheckJoined {
  const _$_CheckJoined();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GroupSearchEvent.checkJoined()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'GroupSearchEvent.checkJoined'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_CheckJoined);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String groupName) started,
    required TResult Function() checkJoined,
  }) {
    return checkJoined();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String groupName)? started,
    TResult? Function()? checkJoined,
  }) {
    return checkJoined?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String groupName)? started,
    TResult Function()? checkJoined,
    required TResult orElse(),
  }) {
    if (checkJoined != null) {
      return checkJoined();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_CheckJoined value) checkJoined,
  }) {
    return checkJoined(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_CheckJoined value)? checkJoined,
  }) {
    return checkJoined?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_CheckJoined value)? checkJoined,
    required TResult orElse(),
  }) {
    if (checkJoined != null) {
      return checkJoined(this);
    }
    return orElse();
  }
}

abstract class _CheckJoined implements GroupSearchEvent {
  const factory _CheckJoined() = _$_CheckJoined;
}

/// @nodoc
mixin _$GroupSearchState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<QueryDocumentSnapshot<Object?>> get queryList =>
      throw _privateConstructorUsedError;
  bool get isJoind => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GroupSearchStateCopyWith<GroupSearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupSearchStateCopyWith<$Res> {
  factory $GroupSearchStateCopyWith(
          GroupSearchState value, $Res Function(GroupSearchState) then) =
      _$GroupSearchStateCopyWithImpl<$Res, GroupSearchState>;
  @useResult
  $Res call(
      {bool isLoading,
      List<QueryDocumentSnapshot<Object?>> queryList,
      bool isJoind});
}

/// @nodoc
class _$GroupSearchStateCopyWithImpl<$Res, $Val extends GroupSearchState>
    implements $GroupSearchStateCopyWith<$Res> {
  _$GroupSearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? queryList = null,
    Object? isJoind = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      queryList: null == queryList
          ? _value.queryList
          : queryList // ignore: cast_nullable_to_non_nullable
              as List<QueryDocumentSnapshot<Object?>>,
      isJoind: null == isJoind
          ? _value.isJoind
          : isJoind // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res>
    implements $GroupSearchStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<QueryDocumentSnapshot<Object?>> queryList,
      bool isJoind});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$GroupSearchStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? queryList = null,
    Object? isJoind = null,
  }) {
    return _then(_$_Initial(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      queryList: null == queryList
          ? _value._queryList
          : queryList // ignore: cast_nullable_to_non_nullable
              as List<QueryDocumentSnapshot<Object?>>,
      isJoind: null == isJoind
          ? _value.isJoind
          : isJoind // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Initial with DiagnosticableTreeMixin implements _Initial {
  const _$_Initial(
      {required this.isLoading,
      required final List<QueryDocumentSnapshot<Object?>> queryList,
      required this.isJoind})
      : _queryList = queryList;

  @override
  final bool isLoading;
  final List<QueryDocumentSnapshot<Object?>> _queryList;
  @override
  List<QueryDocumentSnapshot<Object?>> get queryList {
    if (_queryList is EqualUnmodifiableListView) return _queryList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_queryList);
  }

  @override
  final bool isJoind;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GroupSearchState(isLoading: $isLoading, queryList: $queryList, isJoind: $isJoind)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GroupSearchState'))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty('queryList', queryList))
      ..add(DiagnosticsProperty('isJoind', isJoind));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._queryList, _queryList) &&
            (identical(other.isJoind, isJoind) || other.isJoind == isJoind));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading,
      const DeepCollectionEquality().hash(_queryList), isJoind);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);
}

abstract class _Initial implements GroupSearchState {
  const factory _Initial(
      {required final bool isLoading,
      required final List<QueryDocumentSnapshot<Object?>> queryList,
      required final bool isJoind}) = _$_Initial;

  @override
  bool get isLoading;
  @override
  List<QueryDocumentSnapshot<Object?>> get queryList;
  @override
  bool get isJoind;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
