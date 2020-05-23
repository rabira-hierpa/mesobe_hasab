import 'package:flutter/material.dart';
import 'package:mesobe_hasab/pages/auth/sign_in.dart';
import 'package:mesobe_hasab/pages/auth/sign_up.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool showSignIn = false;

  void toggleView  (){
    setState(()=> showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    return showSignIn ? SignIn(toggleView: toggleView) : SignUp(toggleView: toggleView);
  }
}
