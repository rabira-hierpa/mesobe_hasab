import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

// Sign In anon
  Future signInAnon() async {
    try{
      AuthResult authResult = await _auth.signInAnonymously();
      FirebaseUser anonUser = authResult.user;
      return anonUser;
    }catch(e){
      // TODO: Add an alert box here and show the error message
      // TODO: If an exception occurs push the try again page
      print(e.toString());
      return null;
    }
  }
// Sign In/Register with Google

// Sign In with Email and password

// Register with email and password


// Sign Out


}