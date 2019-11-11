import 'package:cloud_firestore/cloud_firestore.dart';

class ProductData{

  String category;
  String id;
  String title;
  String description;
  bool available;
  String localization;
  List images;

  ProductData.fromDoc(DocumentSnapshot snapshot){
    id = snapshot.documentID;
    title = snapshot.data["title"];
    description = snapshot.data["description"];
    images = snapshot.data["images"];
    available = snapshot.data["available"];
    localization = snapshot.data["localization"];
  }


  String getAvailable() {
    if(available == true){
      return "Disponível";
    } else {
      return "Indisponível";
    }
  }



}