

import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

// this is only to clear the shared preference not to delete account from firebase
Future signOut()async{
  try {
    SharedPreferences sf=await SharedPreferences.getInstance();
                           await sf.setBool('LoggedIn', false);
                              
   SharedPreferences cc=await SharedPreferences.getInstance();
                           await cc.setString('LoggedinUsername','' );

     SharedPreferences bb=await SharedPreferences.getInstance();
                           await bb.setString('LoggedInEmail', '');
   final FirebaseAuth firebaseAuth=FirebaseAuth.instance;
await firebaseAuth.signOut();

  } catch (e) {
   return null;
  }
}