import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

class DataBaseService {
  final String? UId;

  DataBaseService({required this.UId});

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('Users');
  final CollectionReference groupCollection =
      FirebaseFirestore.instance.collection('Groups');

  Future savingUserData(
      {required String fullname,
      required String Email,
      required String Password}) async {
    return await userCollection.doc(UId).set({
      "fullname": fullname,
      "Email": Email,
      "groups": [],
      "profilePic": '',
      "UserId": UId
    });
  }

  // creating group

  Future createGroup(String username, String id, String groupName) async {
    DocumentReference documentReference = await groupCollection.add({
      "groupName": groupName,
      'groupIcon': '',
      'admin': '${username}_${id}',
      'members': [],
      'groupId': '',
      'recentMesseage': '',
      'recentMsessageSender': '',
    });

    // above the groupId cant be assigned since it creates along with the documentRef creation
    // so below it updates that id after creating the documentRef

    await documentReference.update({
      'members': FieldValue.arrayUnion(['${username}_${UId}']),
      "groupId": documentReference.id
    });
    // below is to add the groups that the user involved
    DocumentReference userdocumentReference = await userCollection.doc(UId);
    userdocumentReference.update({
      'groups': FieldValue.arrayUnion(['${groupName}_${documentReference.id}'])
    });


  }

  // following  the fuction is to get groupAdmin name for groupInfo screen

  Future getAdmin() async {
    DocumentSnapshot documentSnapshot = await groupCollection.doc(UId).get();
    // DocumentSnapshot documentSnapshot=await documentReference.get();
    return documentSnapshot;
  }

  // following is to send message in groups
  Future sendMessage(
    String groupId,
    Map<String, dynamic> messageDetails,
  ) async {
    await groupCollection
        .doc(groupId)
        .collection('messages')
        .add(messageDetails);
    await groupCollection.doc(groupId).update({
      "recentMessage": messageDetails['message'],
      "recentMessageSender": messageDetails['sender'],
      "recentmsgTime": messageDetails['time'].toString()
    });


  }
  // following is to check if user has already joined the group or not

  Future<bool> isUserJoined(String groupName, String groupId) async {
    DocumentReference documentReference = userCollection.doc(UId);
    DocumentSnapshot documentSnapshot = await documentReference.get();
    List<dynamic> groups = await documentSnapshot['groups'];
    if (groups.contains('${groupName}_${groupId}')) {
      return true;
    } else {
      return false;
    }
  }

  //            following is to leave from group

  Future leaveGroup(
      {required String groupName, required String groupId, String}) async {
    DocumentSnapshot userSnapshot =
        await userCollection.doc(firebaseAuth.currentUser!.uid).get();

    await userCollection.doc(firebaseAuth.currentUser!.uid).update({
      "groups": FieldValue.arrayRemove(["${groupName}_${groupId}"])
    });
    await groupCollection.doc(groupId).update({
      "members": FieldValue.arrayRemove(
          ["${userSnapshot['fullname']}_${userSnapshot['UserId']}"])
    });

   
  }
  // //          following is to join the group

  // Future joinGroup({required String groupName, required String groupId}) async {
  //   DocumentSnapshot userSnapshot =
  //       await userCollection.doc(firebaseAuth.currentUser!.uid).get();

  //   await userCollection.doc(firebaseAuth.currentUser!.uid).update({
  //     "groups": FieldValue.arrayUnion([
  //       "${groupName}_${groupId}"
  //     ])
  //   });
  //   await groupCollection.doc(groupId).update({
  //     "members": FieldValue.arrayUnion(
  //         ["${userSnapshot['fullname']}_${userSnapshot['UserId']}"])
  //   });
  // }

  // toggle group join/exit

  Future toggleGroupJoin(
      String groupName, String groupId, String username) async {
    DocumentReference userdocumentReference = userCollection.doc(UId);
    DocumentReference groupdocumentRef = groupCollection.doc(groupId);
    DocumentSnapshot documentSnapshot = await userdocumentReference.get();
    List<dynamic> groups = await documentSnapshot['groups'];
    if (groups.contains('${groupName}_${groupId}')) {
      // below for homescreen
      

      await userdocumentReference.update({
        "groups": FieldValue.arrayRemove(["${groupName}_${groupId}"])
      });
      await groupdocumentRef.update({
        "members": FieldValue.arrayRemove(["${username}_${UId}"])
      });
    } else {


      await userdocumentReference.update({
        "groups": FieldValue.arrayUnion(["${groupName}_${groupId}"])
      });
      await groupdocumentRef.update({
        "members": FieldValue.arrayUnion(["${username}_${UId}"])
      });
    }
  }
}

// Login

// this fucntion performs the comparison with firebase and
//returns error if there is any mismatch

Future loginwithemailandpassword(String email, String password) async {
  try {
    User user = (await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password))
        .user!;
    if (user != null) {
      return true;
    }
  } on FirebaseAuthException catch (e) {
    return e.message;
  }
}

// this is just to retrive data from already authorized acoount to put it in shared prefs

Future gettingUserData(String Email) async {
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('Users');
  QuerySnapshot snapshot =
      await userCollection.where('Email', isEqualTo: Email).get();

  return snapshot;
}
