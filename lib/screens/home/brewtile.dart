import 'package:flutter/material.dart';
import 'package:brew_sp/modals/brew.dart';

class BrewTile extends StatelessWidget {
  final Brew brew;
  BrewTile({this.brew});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 9),
      child: Card(
        elevation: 3,
        margin: EdgeInsets.fromLTRB(21.0, 6, 21, 0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 24,
            backgroundColor: Colors.brown[brew.str],
            backgroundImage: AssetImage('assets/coffee_icon.png'),
          ),
          title: Text(brew.name),
          subtitle: Text('Takes ${brew.sugars} sugar(s)'),
        ),
      ),
    );
  }
}
