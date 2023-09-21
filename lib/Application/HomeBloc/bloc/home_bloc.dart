import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState.inital()) {
    on<HomeEvent>((event, emit)async {
      emit(HomeState(isLoading: true, queryList: []));
      DocumentSnapshot documentSnapshot=await FirebaseFirestore.instance.collection('Groups').doc().get();
      final x=documentSnapshot.data();
      
    });
  }
}
