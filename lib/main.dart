import 'package:flutter/material.dart';
import 'package:mesobe_hasab/pages/HomeScreen.dart';
import 'package:mesobe_hasab/pages/splash.dart';

void main() => runApp(MaterialApp(
    initialRoute: '/home',
    routes:{
      '/': (context) => SplashScreen(),
      '/home': (context) => HomeScreen()
    }
));

