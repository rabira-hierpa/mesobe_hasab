import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mesobe_hasab/const/app_styles.dart';
import 'package:mesobe_hasab/const/constants.dart';
import 'package:mesobe_hasab/services/auth_service.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _authService = AuthService();
  //var email and pwd
  String email = '';
  String pwd = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Sign In'),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: AppStyles.primaryColor,
      ),
      body: ListView(children: <Widget>[
        Container(
          //TODO: Add a beautiful vertical animation for the box decoration
//          decoration: BoxDecoration(
//            image: DecorationImage(
//                colorFilter: ColorFilter.mode(AppStyles.primaryColor, BlendMode.darken),
//                fit:BoxFit.cover,
//                image: AssetImage('./assets/promo/bg-cover.png')
//            )
//          ),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // LOGO
                Image(
//                  color: AppStyles.primaryColor,
//                  colorBlendMode: BlendMode.difference,
                  image: AssetImage('./assets/img/logo.png'),
                  width: 150,
                  height: 150,
                ),
                // Email and password sign in Form
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 50),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: const InputDecoration(
                          icon: Icon(
                            Icons.alternate_email,
                            color: AppStyles.secondaryColor,
                          ),
                          labelText: '* Username/Email ',
                          labelStyle: AppStyles.lightThemeTextColor,
                          counterStyle: AppStyles.lightThemeTextColor,
                        ),
                        style: AppStyles.lightThemeTextColor,
                        onChanged: (value) => {setState(() => email = value)},
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          icon: Icon(
                            Icons.lock,
                            color: AppStyles.secondaryColor,
                          ),
                          labelText: '* Password ',
                          labelStyle: AppStyles.lightThemeTextColor,
                          counterStyle: AppStyles.lightThemeTextColor,
                        ),
                        style: AppStyles.lightThemeTextColor,
                        obscureText: true,
                        onChanged: (value) {
                          setState(() => pwd = value);
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                // Email and password sign in button
                Padding(
                  padding: AppStyles.btnPadding,
                  child: RaisedButton(
                    color: AppStyles.secondaryColor,
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.vpn_key,
                            color: AppStyles.primaryColor,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Sign In',
                            softWrap: true,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
                // Google sign in button
                Padding(
                  padding: AppStyles.btnPadding,
                  child: RaisedButton(
                    color: AppStyles.secondaryColor,
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.email,
                            color: AppStyles.primaryColor,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Google Sign In',
                            maxLines: 3,
                            softWrap: true,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
                // Anon sign in button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Don\'t have an account?',
                        style: TextStyle(
                          color: Colors.black26,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Register',
                        style: TextStyle(
                            color: Colors.black26,
                            fontSize: 16,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                ),
                FlatButton(
                  onPressed: () async {
                    Navigator.pushReplacementNamed(context, '/loading');
                  },
                  child: Text(
                    'Skip for now',
                    softWrap: true,
                    style: TextStyle(
                        color: Colors.black12,
                        fontSize: 12,
                        decoration: TextDecoration.underline),
                  ),
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
