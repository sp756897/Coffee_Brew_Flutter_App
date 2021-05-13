import 'package:brew_sp/screens/authenticate/register.dart';
import 'package:brew_sp/screens/authenticate/signin.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showsignin = true;
  void toggleView() {
    setState(() {
      showsignin = !showsignin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return showsignin ? Signin(tv: toggleView) : Register(tv: toggleView);
  }
}
