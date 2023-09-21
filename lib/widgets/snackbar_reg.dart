import 'package:flutter/material.dart';

void showSnackbar({required context,required message,required color,}){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Duration(seconds: 3),
    content: Text(message,style: TextStyle(
      fontSize: 12,color: Colors.white
    ),),backgroundColor: color,));
}