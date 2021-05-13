import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:brew_sp/modals/brew.dart';
import 'package:brew_sp/screens/home/brewtile.dart';

class Brewlist extends StatefulWidget {
  @override
  _BrewlistState createState() => _BrewlistState();
}

class _BrewlistState extends State<Brewlist> {
  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<Brew>>(context) ?? [];

    return ListView.builder(
      itemCount: brews.length,
      itemBuilder: (context, index) {
        return BrewTile(brew: brews[index]);
      },
    );
  }
}
