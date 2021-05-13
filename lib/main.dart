import 'package:brew_sp/screens/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:brew_sp/services/auth.dart';
import 'package:brew_sp/modals/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthSer().user,
      child: MaterialApp(home: Wrapper()),
    );
  }
}
