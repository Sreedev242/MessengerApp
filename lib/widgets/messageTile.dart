import 'package:flutter/material.dart';
import 'package:messenger_app/Core/constants.dart';

class messageTile extends StatefulWidget {
  final String message;
  final String sender;
  final bool sendByMe;
  const messageTile(
      {super.key,
      required this.message,
      required this.sender,
      required this.sendByMe});

  @override
  State<messageTile> createState() => _messageTileState();
}

class _messageTileState extends State<messageTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 4,bottom: 4,left: widget.sendByMe?0:26,right: widget.sendByMe?24:0),
      child: Container(
        alignment: widget.sendByMe?Alignment.bottomRight:Alignment.centerLeft,
        margin: widget.sendByMe?EdgeInsets.only(left: 300,top: 12) :EdgeInsets.only(right: 300,top: 12),
       padding: EdgeInsets.only(top: 17,bottom: 20,left: 20,right: 20),
        decoration: BoxDecoration(
          color: widget.sendByMe ? AppColors.ThemeColor:Colors.grey,
          
          borderRadius:widget.sendByMe? BorderRadius.only(
            topLeft: Radius.circular(17),
            topRight: Radius.circular(17),
            bottomLeft: Radius.circular(17)
          ) : BorderRadius.only(
            topLeft: Radius.circular(17),
            topRight: Radius.circular(17),
            bottomRight: Radius.circular(17)
          )
        ),
        child: 
          Column(crossAxisAlignment:CrossAxisAlignment.start ,
            children: [
            Text(
              widget.sendByMe?'You':widget.sender.toUpperCase()
              ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12,color: Colors.white),),
            SizedBox(height: 8,),
            Text(
              textAlign:TextAlign.center,
              widget.message,style: TextStyle(fontSize: 16,color: Colors.white),)
          ],),
        ),
    );
  
  }
}
