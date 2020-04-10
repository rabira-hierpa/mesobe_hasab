import 'package:flutter/material.dart';
import 'package:mesobe_hasab/pages/splash.dart';

void main() => runApp(MaterialApp(
    initialRoute: '/',
    routes:{
      '/': (context) => SplashScreen(),
    }
));


