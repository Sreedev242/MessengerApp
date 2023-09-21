import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:messenger_app/Infrastructure/DatabaseService.dart';
import 'package:messenger_app/Presentation/HomeScreen.dart';
import 'package:messenger_app/Presentation/RegisterScreen.dart';
import 'package:messenger_app/widgets/snackbar_reg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final Loggingkey = 'LoggedIn';
bool _isLoading=false;
  @override
  Widget build(BuildContext context) {

    final width=MediaQuery.of(context).size.width;
    final _Formkey = GlobalKey<FormState>();

    final ctrlEmail = TextEditingController();
    final ctrlPassword = TextEditingController();

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 235, 220),
      body:_isLoading ? Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor,),)
      
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
                  'Login to Start',
                  style: TextStyle(fontSize: 35, color: Colors.grey),
                ),
                SizedBox(
                  height: 25,
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
                    if (value == null || value.isEmpty) {
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

                          setState(() {
                            _isLoading=true;
                          });

                         await loginwithemailandpassword(ctrlEmail.text, ctrlPassword.text).then((value)async{
                            if (value==true) {
                           QuerySnapshot snapshot=   await gettingUserData(ctrlEmail.text);
                            
                                

                          final _loggedin =
                              await SharedPreferences.getInstance();
                         await _loggedin.setBool(Loggingkey, true);

                               
                           SharedPreferences cc=await SharedPreferences.getInstance();
                           await cc.setString('LoggedinUsername',snapshot.docs[0]['fullname']);

                               SharedPreferences bb=await SharedPreferences.getInstance();
                           await bb.setString('LoggedInEmail', ctrlEmail.text);
                               
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) {
                            return HomeScreen();
                          }));
                            }else{
                              
                              showSnackbar(context: context, message: value, color: Colors.red);
                              setState(() {
                                _isLoading=false;
                              });
                            }


                         });
                      


                         
                        }
                      },
                      child: Text(
                        'Login',
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
                        return RegisterScreen();
                      }));
                    },
                    child: const Text.rich(
                      TextSpan(
                        text: 'Don\'t have account? ',
                        style: TextStyle(fontSize: 15),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Register now',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color:Color.fromARGB(255, 251, 113, 7),
                           
                              )),
                          // can add more TextSpans here...
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
