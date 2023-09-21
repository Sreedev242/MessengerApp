import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'profile_name_event.dart';
part 'profile_name_state.dart';
part 'profile_name_bloc.freezed.dart';

class ProfileNameBloc extends Bloc<ProfileNameEvent, ProfileNameState> {
  ProfileNameBloc() : super(ProfileNameState.initial()) {
    on<_Started>((event, emit)async {
      
      SharedPreferences sf=await SharedPreferences.getInstance();
      final x=sf.getString('LoggedinUsername');
       SharedPreferences sf2=await SharedPreferences.getInstance();
      final y=sf.getString('LoggedInEmail');
      emit(
        ProfileNameState(profile_name: x??'no name',profile_email: y??'no email')
      );


    });
  }
}
