import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:store_app/screens/category_screen.dart';

class CategoryTile extends StatelessWidget {
  final DocumentSnapshot snapshot;

  CategoryTile(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.transparent,
            backgroundImage: NetworkImage(snapshot.data["icon"]),
          ),
          title: Text(snapshot.data["title"]),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            //pega o documento snapshot e passa para a proxima tela.
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CategoryScreen(snapshot)));
          },
        ),
        SizedBox(height: 10,),
        Divider(),
      ],
    );
  }
}
