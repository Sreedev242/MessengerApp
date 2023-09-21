import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_app/Application/ProfileBloc/profile_name_bloc.dart';

import 'package:messenger_app/Core/constants.dart';
import 'package:messenger_app/Infrastructure/Sign_out.dart';
import 'package:messenger_app/Presentation/HomeScreen.dart';
import 'package:messenger_app/Presentation/LoginScreen.dart';
import 'package:messenger_app/Presentation/groupScreen.dart';

class profileScreen extends StatelessWidget {
  const profileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HeightX = MediaQuery.of(context).size.height;
    final Widthx = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.ThemeColor,
        title: Text(
          'Profile',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      drawer: SizedBox(
        width: Widthx * .6,
        child: Drawer(
            backgroundColor: (Colors.white),
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
                            overflow: TextOverflow.clip,
                            state.profile_name,
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          );
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
                  leading: Icon(
                    Icons.groups_rounded,
                    color: AppColors.ThemeColor,
                  ),
                  title: Text('Groups'),
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (ctx) {
                      return HomeScreen();
                    }));
                  },
                  leading: Icon(Icons.home, color: AppColors.ThemeColor),
                  title: Text('Home'),
                ),
                ListTile(
                  onTap: () async {
                    signOut();

                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (ctx) {
                      return LoginScreen();
                    }));
                  },
                  leading: Icon(Icons.logout, color: AppColors.ThemeColor),
                  title: Text('Logout'),
                )
              ],
            )),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            height: HeightX * .5,
            child: BlocBuilder<ProfileNameBloc, ProfileNameState>(
              builder: (context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.account_circle_rounded,
                      size: 100,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text('Username  : ${state.profile_name}',style: TextStyle(color:Colors.grey,fontSize: 18 ),),
                    SizedBox(
                      height: 20,
                    ),
                    Text('Email  : ${state.profile_email}',style: TextStyle(color:Colors.grey,fontSize: 18 ))
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
