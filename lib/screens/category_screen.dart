import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:store_app/models/product_data.dart';
import 'package:store_app/tiles/product_tile.dart';

class CategoryScreen extends StatelessWidget {
  //chamar categoria e id de cada
  final DocumentSnapshot snapshot;

  CategoryScreen(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: Text(snapshot.data["title"]),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.grid_on)),
              Tab(icon: Icon(Icons.list)),
            ],
          ),
        ),
        body: _buildTheQuerryData(),
      ),
    );
  }

  Widget _buildTheQuerryData() {
    return FutureBuilder<QuerySnapshot>(

        //Pega no banco products por id e a categoria informada
        future: Firestore.instance
            .collection("produtos")
            .document(snapshot.documentID)
            .collection("itens")
            .getDocuments(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                //usar o build para optimizar os dados vindo do banco e nao trazer tudo de uma vez
                GridView.builder(
                    padding: EdgeInsets.all(8),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 4.0,
                      crossAxisSpacing: 4.0,
                      childAspectRatio: 0.65,
                    ),
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) {
                      return ProductTile("grid",
                          ProductData.fromDoc(snapshot.data.documents[index]));
                    }),
                ListView.builder(
                    padding: EdgeInsets.all(8),
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) {
                      return ProductTile("list",
                          ProductData.fromDoc(snapshot.data.documents[index]));
                    }),
              ],
            );
          }
        });
  }
}
