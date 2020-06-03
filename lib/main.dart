import 'package:flutter/material.dart';
import 'package:mesobe_hasab/models/user.dart';
import 'package:mesobe_hasab/pages/auth/sign_in.dart';
import 'package:mesobe_hasab/pages/auth/sign_up.dart';
import 'package:mesobe_hasab/pages/template/ViewQuote.dart';
import 'package:mesobe_hasab/pages/ViewQuote.dart';
import 'package:mesobe_hasab/pages/utils/info.dart';
import 'package:mesobe_hasab/pages/utils/splash.dart';
import 'package:mesobe_hasab/services/auth_service.dart';
import 'package:mesobe_hasab/wrapper.dart';
import 'package:provider/provider.dart';
//import 'package:mesobe_hasab/pages/splash.dart';
import 'pages/home/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(StreamProvider<User>.value(
    value: AuthService().user,
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Wrapper(),
        '/loading': (context) => SplashScreen(),
        '/signIn': (context) => SignIn(),
        '/signUp': (context) => SignUp(),
        '/home': (context) => QuoteList(),
        '/info': (context) => InfoPage(),
        '/viewQuote': (context) => ViewQuote()
      },
    ),
  ));
}
