import 'package:flutter/material.dart';
import 'package:messenger_app/Infrastructure/DatabaseService.dart';
import 'package:messenger_app/Presentation/groupScreen.dart';
import 'package:messenger_app/widgets/snackbar_reg.dart';

leaveGroupBox(BuildContext context,{required String groupName,required String groupId})async{
  return showDialog(
    context: context, 
    builder:(context) {
      return AlertDialog(
        title: Text('Exit group'),
        content: Text('Are you sure you want to exit this group?'),

        actions: [
          TextButton(onPressed: ()async{
        
            Navigator.of(context).pop();
          
          }, child: Text('Cancel')),
          TextButton(onPressed: ()async{
                

            await DataBaseService(UId: firebaseAuth.currentUser!.uid).leaveGroup(groupName: groupName, groupId: groupId);
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx){
              return GroupScreen();
            }));
           showSnackbar(context: context, message: 'Left the group ${groupName}', color: Colors.red);

          }, child: Text('Exit group',style: TextStyle(color: Colors.red),)),
          
        ],
      );
    },);

}