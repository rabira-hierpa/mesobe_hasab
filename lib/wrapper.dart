import 'package:flutter/material.dart';
import 'package:mesobe_hasab/pages/auth/auth_screen.dart';
import 'package:mesobe_hasab/pages/home/home.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    Navigator.pushNamed(context, '/home');
  }
  @override
  Widget build(BuildContext context) {
    return AuthScreen();
  }
}
