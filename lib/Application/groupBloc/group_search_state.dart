part of '../groupBloc/group_search_bloc.dart';

@freezed
class GroupSearchState with _$GroupSearchState {
  const factory GroupSearchState({
    required bool isLoading,
    required List<QueryDocumentSnapshot> queryList,
    required  bool isJoind

  }) = _Initial;
  factory GroupSearchState.initial()=>GroupSearchState(
    isLoading: false, 
    queryList: [],
    isJoind: false);
}
