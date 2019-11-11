import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_app/models/product_data.dart';
import 'package:carousel_pro/carousel_pro.dart';

class ProductScreen extends StatefulWidget {
  final ProductData productData;

  ProductScreen(this.productData);

  @override
  _ProductScreenState createState() => _ProductScreenState(productData);
}

class _ProductScreenState extends State<ProductScreen> {
  final ProductData productData;

  _ProductScreenState(this.productData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text(productData.title),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 0.9,
            child: Carousel(
              //retorna imagens em url
              images: productData.images.map((url) {
                return NetworkImage(url);
              }).toList(),
              //
              dotSize: 4,
              dotBgColor: Colors.transparent,
              dotSpacing: 15,
              animationDuration: Duration(milliseconds: 22),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  productData.title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  maxLines: 3,
                ),
                Divider(),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "- " + productData.description,
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(
                  height: 5,
                ),
                Text("- " + productData.getAvailable()),
                SizedBox(
                  height: 5,
                ),
                Text("- " + productData.localization),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
