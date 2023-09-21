import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_app/Application/ProfileBloc/profile_name_bloc.dart';
import 'package:messenger_app/Core/constants.dart';
import 'package:messenger_app/Infrastructure/DatabaseService.dart';
import 'package:messenger_app/Infrastructure/Sign_out.dart';
import 'package:messenger_app/Presentation/HomeScreen.dart';
import 'package:messenger_app/Presentation/LoginScreen.dart';
import 'package:messenger_app/Presentation/profileScreen.dart';
import 'package:messenger_app/Presentation/searchScreen.dart';
import 'package:messenger_app/widgets/groupTile.dart';
import 'package:messenger_app/widgets/noGroup_widget.dart';

class GroupScreen extends StatefulWidget {
  const GroupScreen({super.key});

  @override
  State<GroupScreen> createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen> {
  
    TextEditingController ctrlGroupName=TextEditingController();
  bool _isLoading = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final HeightX = MediaQuery.of(context).size.height;
    final Widthx = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                  return SearchScreen();
                }));
              },
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ))
        ],
        centerTitle: true,
        backgroundColor: AppColors.ThemeColor,
        title: Text(
          'Groups',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
      drawer: SizedBox(
        width: Widthx * .6,
        child: Drawer(
            backgroundColor: (Colors.white),
            child: ListView(
              children: [
                Container(
                  width: Widthx * .6,
                  height: HeightX * .35,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.account_circle_rounded,
                        size: 100,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      BlocBuilder<ProfileNameBloc, ProfileNameState>(
                        builder: (context, state) {
                          return Text(
                            overflow: TextOverflow.clip,
                            state.profile_name,
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          );
                        },
                      )
                    ],
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (ctx) {
                      return HomeScreen();
                    }));
                  },
                  leading: Icon(
                    Icons.home,
                    color: AppColors.ThemeColor,
                  ),
                  title: Text('Home'),
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (ctx) {
                      return profileScreen();
                    }));
                  },
                  leading: Icon(Icons.person, color: AppColors.ThemeColor),
                  title: Text('Profile'),
                ),
                ListTile(
                  onTap: () async {
                    signOut();

                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (ctx) {
                      return LoginScreen();
                    }));
                  },
                  leading: Icon(Icons.logout, color: AppColors.ThemeColor),
                  title: Text('Logout'),
                )
              ],
            )),
      ),
      floatingActionButton: FloatingActionButton(
          tooltip: 'Add',
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: AppColors.ThemeColor,
          onPressed: () {
            popUpDialogueBox(context);
          }),
      body: groupList(),
    );
  }



  groupList() {
    final CollectionReference userCollection =
        FirebaseFirestore.instance.collection('Users');
    return StreamBuilder(

        //   stream: userCollection.doc(firebaseAuth.currentUser!.uid).snapshots(),
        // OR
        stream: FirebaseFirestore.instance
            .collection('Users')
            .doc(firebaseAuth.currentUser!.uid)
            .snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data['groups'] != null) {
              if (snapshot.data['groups'].length != 0) {
                return ListView.separated(

                  separatorBuilder: (context, index) => Divider(),
                  itemBuilder: (BuildContext, index){
                   final reverseIndex=snapshot.data['groups'].length-index-1;
                      return groupTile(
                        groupId: getGrpIdFromUsercolle('${snapshot.data['groups'][reverseIndex]}'), 
                        groupName: getGrpNameFromUsercolle('${snapshot.data['groups'][reverseIndex]}'), 
                        userName: snapshot.data['fullname']);
                  },
                  itemCount: snapshot.data['groups'].length,
                  
                  );
              } else {
                return noGroupWidget();
              }
            } else {
              return noGroupWidget();
            }
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.ThemeColor,
              ),
            );
          }
        });
  }


  popUpDialogueBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return BlocBuilder<ProfileNameBloc, ProfileNameState>(
          builder: (context, state) {
            return AlertDialog(
              title: Text('Create a group'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _isLoading == true
                      ? Center(
                          child: CircularProgressIndicator(
                          color: AppColors.ThemeColor,
                        ))
                      : TextField(
                        controller: ctrlGroupName,
                          decoration: InputDecoration(hintText: 'Group name'),
                        )
                ],
              ),
              actions: [
                ElevatedButton(onPressed: () async {
                  if (ctrlGroupName.text.isNotEmpty) {
                    setState(() {
                      _isLoading=true;
                    });


                    DataBaseService(UId: FirebaseAuth.instance.currentUser!.uid).createGroup(
                      state.profile_name , FirebaseAuth.instance.currentUser!.uid, ctrlGroupName.text)
                      .whenComplete((){
                          setState(() {
                            _isLoading=false;
                          });
                      });


                      Navigator.of(context).pop();
                      ctrlGroupName.clear();

                  }else{
                  return showDialog(context: context, builder:(context) {
                    return AlertDialog(title: Text('Group name is required!!'),
                    actions: [
                      ElevatedButton(onPressed: (){
                        Navigator.of(context).pop();
                      }, child: Text('OK'))
                    ],
                    );
                  },);
                  }
                }, 
                child: Text('OK')),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      ctrlGroupName.clear();
                 
                    },
                    child: Text('Cancel')),
              ],
            );
          },
        );
      },
    );
  }
    String getGrpIdFromUsercolle(String groups){
    return  groups.substring(groups.lastIndexOf('_')+1);
    }
    String getGrpNameFromUsercolle(String groups){
    return (groups.substring(0,groups.lastIndexOf('_')))  ;
    }

}
