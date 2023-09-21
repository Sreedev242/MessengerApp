part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required bool isLoading,
    required List<QueryDocumentSnapshot> queryList
  }) = _Initial;
  factory HomeState.inital()=>HomeState(isLoading: false, queryList: []);
}
