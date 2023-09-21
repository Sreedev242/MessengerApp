import 'package:flutter/material.dart';
import 'package:messenger_app/Core/constants.dart';
import 'package:messenger_app/Presentation/chatScreen.dart';
import 'package:messenger_app/widgets/leaveGroupBox.dart';

class groupTile extends StatelessWidget {
  final String groupId;
  final String groupName;
  final String userName;
  
  const groupTile(
      {super.key,
      required this.groupId,
      required this.groupName,
      required this.userName});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          onTap: () {
           Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
            return chatScreen(
                groupId: groupId,
                groupName: groupName,
                userName: userName,

            );
           }));
          },
          leading: CircleAvatar(
            backgroundColor:AppColors.ThemeColor,
            radius: 24,child:Center(child: Text(groupName[0].toUpperCase(),style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),),),
          title: Text(
            maxLines: 1,
            overflow:TextOverflow.ellipsis,
            groupName),
          subtitle: Text('ID:$groupId',style: TextStyle(color: Colors.grey,fontSize: 12.5),),
          trailing: IconButton(onPressed: ()async{
            leaveGroupBox(context, groupName: groupName, groupId: groupId);
          }, icon: Icon(Icons.delete)),
      
      
        ),
      ),
    );
  }
}
