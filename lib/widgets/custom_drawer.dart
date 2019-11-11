import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:store_app/models/user.dart';
import 'package:store_app/screens/login_screen.dart';
import 'package:store_app/tiles/drawer_tile.dart';

class CustomDrawer extends StatelessWidget {

  final PageController pageController;
  CustomDrawer(this.pageController);

  @override
  Widget build(BuildContext context) {

    Widget _buildDrawerBack() => Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/ceu.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
    );

    return Drawer(
      child: Stack(
        children: <Widget>[
          _buildDrawerBack(),
          _drawerItens(context),
        ],
      ),
    );
  }

  Widget _drawerItens(BuildContext context){
    return ListView(
      padding: EdgeInsets.only(left: 22.0,top:10, right: 22),
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom: 8.0),
          padding: EdgeInsets.fromLTRB(0, 16, 16, 8),
          height: 120,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 20,
                left: 0,
                child: Container(
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 30,
                    child: Image.asset('assets/logof.png'),
                  ),
                )
              ),
              Positioned(
                top: 32,
                left: 70,
                child: ScopedModelDescendant<User>(
                  builder: (context,child,model){
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Olá, ${!model.isLoggedIn() ? "" : model.userData["name"]}",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color: Colors.black87),),
                        SizedBox(height: 5,),
                        GestureDetector(
                          child:Text(
                            !model.isLoggedIn() ?
                            "Entre ou Cadastre-se." : "Sair", style: TextStyle(color: Colors.deepOrange, fontSize: 15),
                          ),
                          onTap: (){
                            if(!model.isLoggedIn()){
                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context)=>LoginScreen())
                              );
                            } else {
                              model.signOut();
                            }

                          },
                        ),
                      ],
                    );
                  },
                )
              ),
            ],
          ),
        ),
        Divider(
          height: 1,
          color: Colors.deepOrange,
        ),
        DrawerTile(Icons.home, "Início",pageController,0),
        DrawerTile(Icons.list, "Espaços",pageController,1),
        DrawerTile(Icons.location_on, "For Coworking",pageController,2),
        DrawerTile(Icons.email, "Contato",pageController,3),
      ],
    );
  }




}
