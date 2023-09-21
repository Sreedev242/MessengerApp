part of '../groupBloc/group_search_bloc.dart';

@freezed
class GroupSearchEvent with _$GroupSearchEvent {
  const factory GroupSearchEvent.started({required String groupName}) = _Started;
// const factory GroupSearchEvent.Reset() = _Reset;
const factory GroupSearchEvent.checkJoined() = _CheckJoined;
}