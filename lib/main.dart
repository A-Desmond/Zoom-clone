import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zoom/controllers/auth.dart';
import 'package:zoom/firebase_options.dart';
import 'package:zoom/screens/home.dart';
import 'package:zoom/screens/login.dart';
import 'package:zoom/screens/video_call_screen.dart';

import 'utils/colors.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const  MyApp());
}

class MyApp extends StatelessWidget {
  const  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ZOOM CLONE',
      theme:
          ThemeData.dark().copyWith(scaffoldBackgroundColor: scaffoldbackgroud),
      home: StreamBuilder(
         stream:Auth().authState,
         builder: (BuildContext context, AsyncSnapshot<User?> snapshot){ 
          if(snapshot.connectionState ==ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator());
          }
          if(snapshot.data!.uid.isNotEmpty){
            return const Home();
          }
          else{
            return const Login();
          }
          },
      ),
      routes: {
        '/login': (context) => const Login(),
        '/home': (context)=> const Home(),
        '/video_call':(context)=>const  JoinMeeting()
      },
    );
  }
}

//progauard file to be added 1 hour 17 mins


