
  import 'package:flutter/material.dart';

noGroupWidget() {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add_circle_outline_outlined,
              color: Colors.grey,
              size: 100,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Click on the add button below to create group \n or search to find already existing groups',
              style: TextStyle(
                  fontSize: 17,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }