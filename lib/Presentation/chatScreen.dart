import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:messenger_app/Core/constants.dart';
import 'package:messenger_app/Infrastructure/DatabaseService.dart';
import 'package:messenger_app/Presentation/groupInfoScreen.dart';
import 'package:messenger_app/widgets/bottomSheet.dart';
import 'package:messenger_app/widgets/groupTile.dart';
import 'package:messenger_app/widgets/messageTile.dart';
    Stream<QuerySnapshot>? chats;
     TextEditingController ctrlMessage=TextEditingController();
 class chatScreen extends StatefulWidget {
  final String groupId;
  final String groupName;
  final String userName;
  const chatScreen(
      {super.key,
      required this.groupId,
      required this.groupName,
      required this.userName});

  @override
  State<chatScreen> createState() => _chatScreenState();
 }

 class _chatScreenState extends State<chatScreen> {
  @override
  Widget build(BuildContext context) {

   
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Row(
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(
                  Icons.arrow_back,
                  size: 17,
                  color: Colors.white,
                )),
            GestureDetector(
              onTap: () {
                // return bottomSheet(context);
              },
              child:  CircleAvatar(
            backgroundColor:Colors.white,
            radius: 14,child:Center(child: Text(widget.groupName[0].toUpperCase(),style:TextStyle(color:AppColors.ThemeColor,fontWeight: FontWeight.bold),),),),
            ),
          ],
        ),
        backgroundColor: AppColors.ThemeColor,
        title: Text(
          overflow: TextOverflow.ellipsis,
          widget.groupName,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        actions: [
          IconButton(
              onPressed: () async {
                final x = await DataBaseService(UId: widget.groupId).getAdmin();

                final data = x.data();

                // OR

                // Map<String, dynamic> adminData = x.data() as Map<String, dynamic>;

                //  print(adminData);

                final adminName = data['admin'].toString();
                final manipulatedAdminName =
                    adminName.substring(0, adminName.lastIndexOf('_'));

                Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                  return groupInfoScreen(
                      groupId: widget.groupId,
                      groupName: widget.groupName,
                      adminName: manipulatedAdminName);
                }));
              },
              icon: Icon(
                Icons.info_outline,
                color: Colors.white,
              ))
        ],
      ),
      body: Stack(
  children: <Widget>[
    chatMessages(),
    
    Positioned(
        bottom: .5,
      child: Container(
        width: MediaQuery.of(context).size.width,
       height: 60,
       
        color: Colors.grey,
        child: Row(
          children: [
            Expanded(
              child: CupertinoTextField(
               placeholder: 'Send message...',
                minLines: 1,
            maxLines: 1000,
                controller: ctrlMessage,
                decoration:BoxDecoration(
                
                ),
              ),

            ),
            SizedBox(width: 16,),
            IconButton(onPressed: (){
            
              return sendMessage();
              
            }, icon: Icon(Icons.send,color: Colors.white,))
          ],
        ),
      ),
    ),
  ],
 ));

  }



chatMessages() {
  return StreamBuilder(
    stream: FirebaseFirestore.instance
        .collection('Groups')
        .doc(widget.groupId)
        .collection('messages')
        .orderBy('time') // Subcollection where messages are stored
        .snapshots(),
    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return CircularProgressIndicator();
      }

      if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
        return Center(child: Text('Start messaging',style: TextStyle(color: Colors.grey,fontStyle: FontStyle.italic),));
      }

      final messages = snapshot.data!.docs;

      return Padding(
        padding: const EdgeInsets.only(bottom: 80.0),
        child: ListView.builder(
          itemCount: messages.length,
          itemBuilder: (context, index) {
            final messageData = messages[index].data() as Map<String, dynamic>;
            final message = messageData['message'];
            final sender = messageData['sender'];
            final sendByMe = widget.userName == sender;
      
            return messageTile(
              message: message,
              sender: sender,
              sendByMe: sendByMe,
            );
          },
        ),
      );
    },
  );
}



 sendMessage()async{
  if (ctrlMessage.text.isNotEmpty) {
    final Map<String,dynamic> messageMap={
      "message":ctrlMessage.text,
      "sender":widget.userName,
      "time":DateTime.now().millisecondsSinceEpoch
    };
    await DataBaseService(UId: firebaseAuth.currentUser!.uid).sendMessage(widget.groupId,messageMap);
  }
  setState(() {
    ctrlMessage.clear();
  });
 }
} 
