import 'package:brew_sp/modals/user.dart';
import 'package:brew_sp/prefabs/loading.dart';
import 'package:brew_sp/services/data.dart';
import 'package:flutter/material.dart';
import 'package:brew_sp/prefabs/reuse.dart';
import 'package:provider/provider.dart';

class Settinsform extends StatefulWidget {
  @override
  _SettinsformState createState() => _SettinsformState();
}

class _SettinsformState extends State<Settinsform> {
  final _formkey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];
  String _cn;
  String _cs;
  int _cstr;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder<Userdata>(
        stream: Dataser(uid: user.uid).userdata,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Userdata userd = snapshot.data;
            return Form(
              key: _formkey,
              child: ListView(
                children: <Widget>[
                  Text('Update Brew Settings'),
                  SizedBox(
                    height: 21,
                  ),
                  TextFormField(
                    initialValue: userd.name,
                    decoration: textdec.copyWith(hintText: 'Name'),
                    validator: (value) =>
                        value.isEmpty ? 'Please Enter a Name' : null,
                    onChanged: (value) => setState(() => _cn = value),
                  ),
                  SizedBox(
                    height: 21,
                  ),
                  DropdownButtonFormField(
                      decoration: textdec.copyWith(hintText: 'Sugars'),
                      value: _cs ?? userd.sugars,
                      items: sugars.map((sugar) {
                        return DropdownMenuItem(
                          value: sugar,
                          child: Text('$sugar sugar(s)'),
                        );
                      }).toList(),
                      onChanged: (value) => setState(() => _cs = value)),
                  Slider(
                    inactiveColor: Colors.brown[_cstr ?? 100],
                    activeColor: Colors.brown[_cstr ?? 100],
                    value: (_cstr ?? userd.str).toDouble(),
                    min: 100,
                    max: 900,
                    divisions: 8,
                    onChanged: (value) => setState(() => _cstr = value.round()),
                  ),
                  RaisedButton(
                      color: Colors.blue,
                      child: Text('Update'),
                      onPressed: () async {
                        if (_formkey.currentState.validate()) {
                          await Dataser(uid: user.uid).upuser(
                              _cs ?? userd.sugars,
                              _cn ?? userd.name,
                              _cstr ?? userd.str);
                          Navigator.pop(context);
                        }
                      })
                ],
              ),
            );
          } else {
            return Load();
          }
        });
  }
}
