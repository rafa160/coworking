import 'package:flutter/material.dart';
import 'package:store_app/tabs/home_tab.dart';
import 'package:store_app/tabs/products_tab.dart';
import 'package:store_app/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {

  final _pageController = PageController();


  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          body: HomeTab(),
          drawer: CustomDrawer(_pageController),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Categorias"),
            centerTitle: true,
            backgroundColor: Colors.lightBlue
          ),
          drawer: CustomDrawer(_pageController),
          body: ProductsTab(),
        ),
        Container(color: Colors.yellowAccent,),
        Container(color: Colors.blueAccent,),
      ],
    );
  }
}