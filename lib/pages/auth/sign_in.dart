import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
      backgroundColor: Color.fromRGBO(18, 17, 111, 10),
      appBar: AppBar(
        title: Text('Sign In Screen'),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Color.fromRGBO(18, 17, 111, 10),
      ),
      body: ListView(children: <Widget>[
        Container(
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // Email and password sign in Form
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 50),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: const InputDecoration(

                          icon: Icon(Icons.alternate_email),
                          hintText: 'someone@mail-provider.com',
                          labelText: 'Email *',
                          counterStyle: TextStyle(
                            color: Colors.white
                          )
                        ),
                        onChanged: (value) => {setState(() => email = value)},
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        obscureText: true,
                        onChanged: (value) {
                          setState(() => pwd = value);
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                // Email and password sign in button
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton.icon(
                      color: Color.fromRGBO(246, 155, 15, 1),
                      onPressed: () {},
                      icon: Icon(Icons.vpn_key),
                      label: Text(
                        'Sigin In',
                        style: TextStyle(color: Colors.white, fontSize: 26),
                      )),
                ),
                // Google sign in button
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton.icon(
                      color: Color.fromRGBO(246, 155, 15, 1),
                      onPressed: () {},
                      icon: Icon(Icons.vpn_key),
                      label: Text(
                        'Google Sign In',
                        maxLines: 3,
                        softWrap: true,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                        ),
                      )),
                ),
                // Anon sign in button
                FlatButton(
                  onPressed: () async {
                    Navigator.pushReplacementNamed(context, '/loading');
                  },
                  child: Text(
                    'Skip for now',
                    maxLines: 3,
                    softWrap: true,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
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
