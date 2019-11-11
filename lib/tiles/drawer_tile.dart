import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {

  final IconData icon;
  final String text;
  final PageController pageController;
  final int page;


  DrawerTile(this.icon, this.text, this.pageController, this.page);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: (){
          Navigator.of(context).pop();
          pageController.jumpToPage(page);
        },
        child: Container(
          height: 60,
          child: Row(
            children: <Widget>[
              Icon(
                icon,
                size: 30,
                color: pageController.page.round() == page ? Colors.black87 : Colors.grey,
              ),
              SizedBox(width: 10,),
              Text(text,
              style: TextStyle(fontSize: 15, color: pageController.page.round() == page ? Colors.black87 : Colors.grey),),
            ],
          ),
        ),
      ),
    );
  }
}
