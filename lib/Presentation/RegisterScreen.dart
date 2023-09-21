import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:messenger_app/Core/constants.dart';
import 'package:messenger_app/Infrastructure/DatabaseService.dart';
import 'package:messenger_app/Presentation/HomeScreen.dart';
import 'package:messenger_app/Presentation/LoginScreen.dart';
import 'package:messenger_app/widgets/snackbar_reg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
    
    bool _isLoading=false;
  final _Formkey = GlobalKey<FormState>();

  final ctrlUsername = TextEditingController();

  final ctrlPassword = TextEditingController();

  final ctrlEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    return Scaffold(
      
      backgroundColor: Color.fromARGB(255, 255, 235, 220),
      body: _isLoading?Center(child: CircularProgressIndicator(color: AppColors.ThemeColor,),)
      
      : SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _Formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 7,
                ),
                Text(
                  'Register Account',
                  style: TextStyle(fontSize: 35, color: Colors.grey),
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  controller: ctrlUsername,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.people,
                        color: Color.fromARGB(255, 227, 102, 7),
                      ),
                      hintText: 'Username'),
                  validator: (value) {
                    if (value == null || value.isEmpty || value == " ") {
                      return "Field can\'t be empty";
                    } else if (ctrlUsername.text.length < 4) {
                      return "Atleast 4 charecters required";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: ctrlEmail,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Color.fromARGB(255, 227, 102, 7),
                      ),
                      hintText: 'Email'),
                  validator: (value) {
                    if (value == null || value.isEmpty || value == " ") {
                      return "Field can\'t be empty";
                    } else if (!ctrlEmail.text.contains('@')) {
                      return "Invalid email id";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: ctrlPassword,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 237, 103, 0))),
                      prefixIcon: Icon(Icons.lock,
                          color: Color.fromARGB(255, 227, 102, 7)),
                      hintText: 'Password'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Field can\'t be empty";
                    } else if (ctrlPassword.text.length < 5) {
                      return "Atleast 5 charecters required";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: width*.9,
                  height: 35,
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 251, 113, 7)),
                      ),
                      onPressed: () async {
                        if (_Formkey.currentState!.validate()) {

                         
                          // authservice.update
                          final FirebaseAuth firebaseAuth =
                              FirebaseAuth.instance;
                          try {
                            User user = (await firebaseAuth
                                    .createUserWithEmailAndPassword(
                              email: ctrlEmail.text.trim(),
                              password: ctrlPassword.text.trim(),
                            )).user!;
                                 setState(() {
                            _isLoading=true;
                          });

                            if (user != null) {
                             await DataBaseService(UId: user.uid).savingUserData(
                                fullname: ctrlUsername.text.trim(),
                                Email: ctrlEmail.text.trim(),
                                Password: ctrlPassword.text.trim(),
                              );
                             
                          final _loggedin =
                              await SharedPreferences.getInstance();
                         await _loggedin.setBool('LoggedIn', true);
                              
                           SharedPreferences cc=await SharedPreferences.getInstance();
                           await cc.setString('LoggedinUsername',ctrlUsername.text );

                               SharedPreferences bb=await SharedPreferences.getInstance();
                           await bb.setString('LoggedInEmail', ctrlEmail.text);
                            }


                            
      
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx){
                              return HomeScreen();
                            }));

                          } on FirebaseAuthException catch (e) {

                            setState(() {
                              _isLoading=false;
                            });
                            // This snack is in widget file
                            showSnackbar(
                              context: context,
                               message: e.message , 
                               color:Colors.red);
                          }
                        }
                      },
                      child: Text(
                        'Create Account',
                        style: TextStyle(color: Colors.white),
                      )),
                ),
                SizedBox(
                  height: 12,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (ctx) {
                      return LoginScreen();
                    }));
                  },
                  child: const Text.rich(
                    TextSpan(
                      text: 'Already have account? ',
                      style: TextStyle(fontSize: 15),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Login',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 251, 113, 7),
                              
                            )),
                        // can add more TextSpans here...
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
