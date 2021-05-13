import 'package:brew_sp/prefabs/loading.dart';
import 'package:brew_sp/prefabs/reuse.dart';
import 'package:brew_sp/services/auth.dart';
import 'package:flutter/material.dart';

class Signin extends StatefulWidget {
  final Function tv;
  Signin({this.tv});
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final AuthSer _auth = AuthSer();
  final _formkey = GlobalKey<FormState>();
  bool loading = false;

  String email = "";
  String pass = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return loading
        ? Load()
        : Scaffold(
            resizeToAvoidBottomPadding: false,
            backgroundColor: Colors.white,
            appBar: AppBar(
                backgroundColor: Colors.blue,
                elevation: 3,
                actions: <Widget>[
                  FlatButton.icon(
                      onPressed: () {
                        widget.tv();
                      },
                      icon: Icon(Icons.person),
                      label: Text("Register"))
                ],
                title: Text("Sign in Brew-Crew")),
            body: SafeArea(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: textdec,
                        validator: (value) =>
                            value.isEmpty ? 'Enter your Email' : null,
                        onChanged: (value) {
                          email = value;
                        },
                      ),
                      SizedBox(height: 3),
                      TextFormField(
                        decoration: textdec.copyWith(hintText: 'Password'),
                        validator: (value) => value.length < 6
                            ? 'Enter a Password 6+ Characters long'
                            : null,
                        obscureText: true,
                        onChanged: (value) {
                          setState(() {
                            pass = value;
                          });
                        },
                      ),
                      SizedBox(height: 3),
                      RaisedButton(
                        color: Colors.blue,
                        child: Text("Sign In"),
                        onPressed: () async {
                          if (_formkey.currentState.validate()) {
                            setState(() {
                              loading = true;
                            });
                            dynamic res = await _auth.signep(email, pass);
                            if (res == null) {
                              setState(() {
                                loading = false;
                                error = 'Please provide valid inputs';
                              });
                            }
                          }
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        error,
                        style: TextStyle(color: Colors.red),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
