import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_app/Application/ProfileBloc/profile_name_bloc.dart';
import 'package:messenger_app/Application/groupBloc/group_search_bloc.dart';
import 'package:messenger_app/Presentation/LoginScreen.dart';
import 'package:messenger_app/Core/constants.dart';
import 'package:messenger_app/Presentation/groupScreen.dart';
import 'package:messenger_app/Presentation/splashScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: WebFirebaseIDs.apiKey,
          appId: WebFirebaseIDs.appId,
          messagingSenderId: WebFirebaseIDs.messagingSenderId,
          projectId: WebFirebaseIDs.projectId),
    );
  }

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  bool isloggedin = false;
  @override
  void initState() {
    CheckLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
         BlocProvider(create: (context) => ProfileNameBloc()),
        BlocProvider(
            create: (context) => GroupSearchBloc()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                seedColor: Color.fromARGB(255, 251, 113, 7)),
            useMaterial3: true,
          ),
          home: isloggedin ? GroupScreen() :SplashScreen()),
    );
  }

  Future<void> CheckLogin() async {
    final _loggedin = await SharedPreferences.getInstance();
    final LoggedIn = _loggedin.getBool('LoggedIn');
    if (LoggedIn==false || LoggedIn==null) {
      setState(() {
        isloggedin = false;
      });
      
    }else{
      setState(() {
        isloggedin=true;
      });
    }
  }
}
