part of 'profile_name_bloc.dart';

@freezed
class ProfileNameState with _$ProfileNameState {
  const factory ProfileNameState({
    required String profile_name,required String profile_email
  }) = _Initial;

  factory ProfileNameState.initial()=>ProfileNameState(profile_name: '',profile_email: '');
}
