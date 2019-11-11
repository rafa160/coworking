import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:store_app/models/user.dart';
import 'package:store_app/screens/signup_screen.dart';

class LoginScreen extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text("Entrar"),
        centerTitle: true,
        actions: <Widget>[
          FlatButton(
            child: Text(
              "CRIAR CONTA",
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
            onPressed: () {
              //Re
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => SignUpScreen())
              );
            },
          ),
        ],
      ),
      body: ScopedModelDescendant<User>(
        builder: (context, child, model) {
          if (model.isLoading){
            return Center(child: CircularProgressIndicator(),);
          } else {
            return Form(
              key: _formKey,
              child: ListView(
                padding: EdgeInsets.all(16),
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(hintText: "E-mail"),
                    keyboardType: TextInputType.emailAddress,
                    validator: (text) {
                      if (text.isEmpty || !text.contains("@")) {
                        return "E-mail inválido";
                      }
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    decoration: InputDecoration(hintText: "Senha"),
                    obscureText: true,
                    validator: (text) {
                      if (text.isEmpty) {
                        return "Senha precisa ser preenchida";
                      } else if (text.length < 6) {
                        return "Senha precisa conter mínimo 6 caracteres";
                      }
                    },
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                      onPressed: () {},
                      child: Text(
                        "Esqueci minha senha",
                        textAlign: TextAlign.right,
                      ),
                      //faz com que o alinhamento fique zerado para o lado que o textAling foi informado
                      padding: EdgeInsets.zero,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    height: 44,
                    child: RaisedButton(
                      child: Text(
                        "Entrar",
                        style: TextStyle(fontSize: 18),
                      ),
                      textColor: Colors.white,
                      color: Colors.lightBlue,
                      onPressed: () {
                        if (_formKey.currentState.validate()) {

                        }

                        model.signIn();

                      },
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
