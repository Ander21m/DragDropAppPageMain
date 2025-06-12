

import 'package:flutter/material.dart';
import 'package:imagedragdrop2/Account/Login.dart';
import 'package:imagedragdrop2/Account/Signup.dart';


class LoginOrSignUp extends StatefulWidget {
  const LoginOrSignUp({super.key});

  @override
  State<LoginOrSignUp> createState() => _LoginOrSignUpState();
}

class _LoginOrSignUpState extends State<LoginOrSignUp> {

  bool isLogin = true;

  void toggle(){
    setState(() {
      isLogin = !isLogin;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(isLogin){
      return LoginPage(onTap:toggle );
    }
    else{
      return RegisterPage(onTap:toggle );
    }
  }
}
