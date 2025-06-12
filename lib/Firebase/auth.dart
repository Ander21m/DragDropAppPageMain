


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:imagedragdrop2/Account/LoginOrSignUp.dart';
import 'package:imagedragdrop2/main.dart';



class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(stream:FirebaseAuth.instance.authStateChanges() , builder: (context,snapshot){
      if(snapshot.hasData){
        return const MyHomePage();
      }
      else{
        return const LoginOrSignUp();
      }
    });
  }
}