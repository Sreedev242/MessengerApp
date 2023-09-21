import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:messenger_app/Core/constants.dart';
import 'package:messenger_app/widgets/leaveGroupBox.dart';

class groupInfoScreen extends StatelessWidget {
  final String groupId;
  final String groupName;
  final String adminName;
  const groupInfoScreen(
      {super.key,
      required this.groupId,
      required this.groupName,
      required this.adminName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.ThemeColor,
        centerTitle: true,
        title: Text(
          'Group Info',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {
                leaveGroupBox(context, groupName: groupName, groupId: groupId);
              },
              icon: const Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ))
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(decoration: BoxDecoration(borderRadius: BorderRadiusDirectional.circular(10)),
          
                child: ListTile(
                          tileColor: Color.fromARGB(255, 255, 178, 120),
                leading:  CircleAvatar(
            backgroundColor:AppColors.ThemeColor,
            radius: 24,child:Center(child: Text(groupName[0].toUpperCase(),style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),),),
                title: Center(child: Text('Group : $groupName')),
                subtitle: Center(child: Text('Admin : $adminName')),
                            ),),SizedBox(height: 7,),
              Expanded(
                child: StreamBuilder(
                stream: FirebaseFirestore.instance.collection('Groups').doc(groupId).snapshots(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data['members'] != null) {
                      if (snapshot.data['members'].length != 0) {
                        return ListView.separated(
                          separatorBuilder: (context, index) {
                return SizedBox(height: 8,);
                          },
                          itemBuilder: (context, index) {
                final name = snapshot.data['members'][index];
                final memberName = name.substring(0, name.lastIndexOf('_'));
                final memberID = name.substring(name.lastIndexOf('_') + 1);
                return ListTile(
                title: Text(memberName),
                subtitle: Text(memberID),
                          
                );
                          },
                          itemCount: snapshot.data['members'].length
                        );
                      }
                    }
                  }
                  
                  return Center(
                    child: Text(
                      'No members',
                      style: TextStyle(color: Colors.grey),
                    ),
                  );
                },
              ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
