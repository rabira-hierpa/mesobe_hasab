import 'package:firebase_auth/firebase_auth.dart';
import 'package:mesobe_hasab/models/user.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

//  Create a user object based on FirebaseUser
//  _anonFBUser - anonymous FirebaseUser
  User _anonFBUser(FirebaseUser user){
    return user != null ? User(uid: user.uid) : null;
  }

//  Auth change user stream
  Stream<User> get user{
    return _auth.onAuthStateChanged.map((FirebaseUser user) => _anonFBUser(user));
  }

// Sign In anon
  Future signInAnon() async {
    try{
      AuthResult authResult = await _auth.signInAnonymously();
      FirebaseUser anonUser = authResult.user;
      return _anonFBUser(anonUser);
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
  Future signOut() async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }

}