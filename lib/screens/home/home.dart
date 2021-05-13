import 'package:brew_sp/modals/brew.dart';
import 'package:brew_sp/screens/home/sett.dart';
import 'package:brew_sp/services/data.dart';
import 'package:flutter/material.dart';
import 'package:brew_sp/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:brew_sp/screens/home/brewlist.dart';

class Home extends StatelessWidget {
  final AuthSer _auth = AuthSer();

  @override
  Widget build(BuildContext context) {
    void _showset() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 21, horizontal: 60),
              child: Settinsform(),
            );
          });
    }

    return StreamProvider<List<Brew>>.value(
      value: Dataser().brews,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Brew Adda',
            style: TextStyle(fontSize: 18),
          ),
          backgroundColor: Colors.blue,
          elevation: 3,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.settings),
              label: Text('Settings'),
              onPressed: () => _showset(),
            ),
            FlatButton.icon(
                onPressed: () async {
                  await _auth.signout();
                },
                icon: Icon(Icons.person),
                label: Text('Logout')),
          ],
        ),
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/coffee_bg.png'), fit: BoxFit.cover),
            ),
            child: Brewlist()),
      ),
    );
  }
}
