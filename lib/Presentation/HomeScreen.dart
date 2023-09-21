import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_app/Application/ProfileBloc/profile_name_bloc.dart';

import 'package:messenger_app/Core/constants.dart';
import 'package:messenger_app/Infrastructure/Sign_out.dart';
import 'package:messenger_app/Presentation/LoginScreen.dart';
import 'package:messenger_app/Presentation/groupScreen.dart';
import 'package:messenger_app/Presentation/profileScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ProfileNameBloc>().add(ProfileNameEvent.started());
    final HeightX = MediaQuery.of(context).size.height;
    final Widthx = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 251, 113, 7),
        ),
        drawer: SizedBox(
          width: Widthx * .6,
          child: Drawer(
              backgroundColor: ( Colors.white),
              child: ListView(
                children: [
                  Container(
                    width: Widthx * .6,
                    height: HeightX * .35,
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.account_circle_rounded,
                          size: 100,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        BlocBuilder<ProfileNameBloc, ProfileNameState>(
                          builder: (context, state) {
                            return Text(
                              overflow:TextOverflow.clip,
                              state.profile_name,style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),);
                          },
                        )
                      ],
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (ctx) {
                        return GroupScreen();
                      }));
                    },
                    leading: Icon(Icons.groups_rounded,color: AppColors.ThemeColor,),
                    title: Text('Groups'),
                  ),
                  ListTile(
                    onTap: ()  {

                      Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                        return profileScreen();
                      }));
                    },
                    leading: Icon(Icons.person,color: AppColors.ThemeColor),
                    title: Text('Profile'),
                  ),
                  ListTile(
                    onTap: () async {
                      signOut();

                      Navigator.of(context)
                          .pushReplacement(MaterialPageRoute(builder: (ctx) {
                        return LoginScreen();
                      }));
                    },
                    leading: Icon(Icons.logout,color: AppColors.ThemeColor),
                    title: Text('Logout'),
                  )
                ],
              )),
        ),
       );
}
}