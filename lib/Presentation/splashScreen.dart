import 'dart:async';
import 'dart:js_util';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:messenger_app/Presentation/LoginScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isDisposed=false;
  @override
  void initState() {
    Timer(Duration(seconds: 5), () {
      if (_isDisposed==false) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx){
        return LoginScreen();
      }));
      }
      
     });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image:AssetImage('images/splashImage.jpg') ,
          onError: (exception, stackTrace) {
            // Handle image loading error here
            print('Error loading image: $exception');
          },
        ),
      ),
    );
  }
  @override
  void dispose() {
    _isDisposed=true;
    super.dispose();
  }
}


