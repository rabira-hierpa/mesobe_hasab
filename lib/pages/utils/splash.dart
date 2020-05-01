import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(10,18, 17, 111),
      body: Container(
//        decoration: BoxDecoration(
//          image: DecorationImage(
//            image: AssetImage('assets/img/splash.jpg'),
//            fit: BoxFit.fill
//          )
//        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            SpinKitRing(
              color: Colors.white,
              size: 45.0,
            ),
          ],
        ),
      ),
    );
  }
}