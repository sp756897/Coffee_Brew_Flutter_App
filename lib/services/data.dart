import 'package:brew_sp/modals/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:brew_sp/modals/brew.dart';

class Dataser {
  final String uid;
  Dataser({this.uid});
  final CollectionReference brewcol = Firestore.instance.collection('Brew');

  Future upuser(String sugars, String name, int str) async {
    return await brewcol
        .document(uid)
        .setData({'sugars': sugars, 'name': name, 'strength': str});
  }

//brew list
  List<Brew> _brewlistsnap(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Brew(
          name: doc.data['name'] ?? '',
          sugars: doc.data['sugars'] ?? '0',
          str: doc.data['strength'] ?? 0);
    }).toList();
  }

  //get bew snp
  Stream<List<Brew>> get brews {
    return brewcol.snapshots().map(_brewlistsnap);
  }

//user data from snap
  Userdata _userdatafromsnap(DocumentSnapshot snapshot) {
    return Userdata(
      uid: uid,
      name: snapshot.data['name'],
      sugars: snapshot.data['sugars'],
      str: snapshot.data['strength'],
    );
  }

  //get user data
  Stream<Userdata> get userdata {
    return brewcol.document(uid).snapshots().map(_userdatafromsnap);
  }
}
