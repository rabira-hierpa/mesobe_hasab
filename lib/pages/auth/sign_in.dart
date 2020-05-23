import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mesobe_hasab/const/app_styles.dart';
import 'package:mesobe_hasab/const/constants.dart';
import 'package:mesobe_hasab/services/auth_service.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();

}

class _SignInState extends State<SignIn> {

  final AuthService _authService = AuthService();
  final  _formState = GlobalKey<FormState>();
  //var email and pwd
  String email,pwd,error = '';

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
            key: _formState,
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
                // --> Error Message
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,5,0,0),
                  child: Center(
                    child: Text(error,style: AppStyles.regError,) ,
                  ),
                ),
                // Sign in Form
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
                          labelText: '* Email ',
                          labelStyle: AppStyles.lightThemeTextColor,
                          counterStyle: AppStyles.lightThemeTextColor,
                        ),
                        style: AppStyles.lightThemeTextColor,
                        onChanged: (value) => {setState(() => email = value)},
                        validator: (val) => val.isEmpty ? 'username is required': null ,
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
                        validator: (val) => val.isEmpty ? 'Password is required ': null,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                // --> Sign in BUTTON
                Padding(
                  padding: AppStyles.btnPadding,
                  child: RaisedButton(
                    color: AppStyles.secondaryColor,
                    onPressed: () async {
                      if(_formState.currentState.validate()){
                        dynamic result = await _authService.signEmailPassword(email, pwd);
                        if(result == null){
                          setState(() {
                            error = 'Error! Unable to sign in';
                          });
                        }else{
                          setState(() {
                            error = '';
                          });
                        }
                      }
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
                        'Don\'t have an account?',
                        style: TextStyle(
                          color: Colors.black26,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        widget.toggleView();
                      },
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
                // --> Anon signing link
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
