import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:messenger_app/Infrastructure/DatabaseService.dart';

part 'group_search_event.dart';
part 'group_search_state.dart';
part 'group_search_bloc.freezed.dart';

class GroupSearchBloc extends Bloc<GroupSearchEvent, GroupSearchState> {
  GroupSearchBloc() : super(GroupSearchState.initial()) {
   
    on<_Started>((event, emit) async {
       List<QueryDocumentSnapshot>Y=[];
      emit(GroupSearchState(isLoading: true, queryList: [],isJoind: false));

      QuerySnapshot x = await FirebaseFirestore.instance
          .collection('Groups')
          .where("groupName", isEqualTo: event.groupName)
          .get();

        Y.addAll(x.docs);
         
      emit(GroupSearchState(isLoading: false, queryList: Y,isJoind: false));
    });
    // on<_Reset>((event, emit) async{
    //   emit(GroupSearchState.initial());
    // });

   
  }
}
