import 'package:brew_sp/modals/user.dart';
import 'package:brew_sp/services/data.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthSer {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _authfromfirebase(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

//auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_authfromfirebase);
  }

  //sign in anon
  Future signin() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _authfromfirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signep(String email, String pass) async {
    try {
      AuthResult res =
          await _auth.signInWithEmailAndPassword(email: email, password: pass);
      FirebaseUser user = res.user;
      return _authfromfirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future reg(String email, String pass) async {
    try {
      AuthResult res = await _auth.createUserWithEmailAndPassword(
          email: email, password: pass);
      FirebaseUser user = res.user;
      //create data
      await Dataser(uid: user.uid).upuser('0', 'name', 100);
      return _authfromfirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signout() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
