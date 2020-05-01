import 'package:flutter/material.dart';
import 'package:mesobe_hasab/pages/auth/sign_in.dart';
import 'package:mesobe_hasab/pages/template/ViewQuote.dart';
import 'package:mesobe_hasab/pages/utils/info.dart';
import 'package:mesobe_hasab/pages/utils/splash.dart';
import 'package:mesobe_hasab/wrapper.dart';
//import 'package:mesobe_hasab/pages/splash.dart';
import 'pages/home/home.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Wrapper(),
        '/loading': (context) => SplashScreen(),
        '/signIn': (context) => SignIn(),
        '/home': (context) => QuoteList(),
        '/info': (context) => InfoPage(),
        '/viewQuote': (context) => ViewQuote()
      },
    ));
