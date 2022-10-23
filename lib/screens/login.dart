// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:zoom/widget/button.dart';
import 'package:zoom/controllers/auth.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final Auth _auth = Auth();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text(
              'Start or Join a meeting',  
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.w800),
            ),
           const  SizedBox(
              height: 80,
            ),
            Button(
              text: 'Google Sign In',
              onPressed: () async{
                bool res =  await _auth.singInWithGoogle(context);
                if(res){
                  Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
