import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mesobe_hasab/services/auth_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AuthService _authService = AuthService();
  @override
  void initState()  {
    super.initState();
    signInAnon();
  }

  void signInAnon() async {
    dynamic anonResult = await _authService.signInAnon();
    if (anonResult == null) {
      showDialog(
          context: context,
          barrierDismissible: true,
          builder: (_) => AlertDialog(
            title: Text('Error! '),
            content: Text('Couldn\'t Sign in for the moment'),
            actions: <Widget>[
              FlatButton(
                child: Text("Ok"),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
            elevation: 24.0,
            backgroundColor: Color.fromRGBO(246, 155, 15, 1),
          ));
    } else {
      Navigator.pushNamed(context, '/home');
      print('Signed In');
      print(anonResult.uid);
    }
  }

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
          mainAxisAlignment: MainAxisAlignment.center,
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