import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:store_app/models/user.dart';

import 'screens/home_screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScopedModel<User>(
      model: User(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.red,
            primaryColor: Colors.blueGrey
        ),
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}


