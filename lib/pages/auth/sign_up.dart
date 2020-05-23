import 'package:flutter/material.dart';
import 'package:mesobe_hasab/const/app_styles.dart';
import 'package:mesobe_hasab/services/auth_service.dart';

class SignUp extends StatefulWidget {
  final Function toggleView;
  SignUp({this.toggleView});
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthService _authService = AuthService();
  // --> State vars
  String email,pwd,username = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Sign Up'),
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
                // --> LOGO
                Image(
//                  color: AppStyles.primaryColor,
//                  colorBlendMode: BlendMode.difference,
                  image: AssetImage('./assets/img/logo.png'),
                  width: 150,
                  height: 150,
                ),
                // --> Email and password sign in FORM
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 50),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.person,
                            color:AppStyles.secondaryColor
                          ),
                          labelText: '* Username',
                          labelStyle: AppStyles.lightThemeTextColor,
                          counterStyle: AppStyles.lightThemeTextColor,
                        ),
                        onChanged: (value) => {setState(() => username = value)},
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          icon: Icon(
                            Icons.alternate_email,
                            color: AppStyles.secondaryColor,
                          ),
                          labelText: '* Email ',
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
                // --> Sign Up BUTTON
                Padding(
                  padding: AppStyles.btnPadding,
                  child: RaisedButton(
                    color: AppStyles.secondaryColor,
                    onPressed: () async {
                      print(email);
                      print(pwd);
                      print(username);
                    },
                    splashColor: AppStyles.splashColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 8.0),
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
                            'Sign Up',
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
                // --> Google sign in button
                Padding(
                  padding: AppStyles.btnPadding,
                  child: RaisedButton(
                    color: AppStyles.secondaryColor,
                    onPressed: () {
                    },
                    splashColor: AppStyles.splashColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset('./assets/icons/google_icon.png',width: 30,height:30,),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Google',
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
                // --> Register Link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Have an account?',
                        style: TextStyle(
                          color: AppStyles.lightThemeLabelColors,
                          fontSize: AppStyles.labelFontSize,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        widget.toggleView();
                      },
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                            color: AppStyles.lightThemeLabelColors,
                            fontSize: AppStyles.labelFontSize,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                ),
                // --> Anon sign in button
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

