import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class User extends Model {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Firestore firestore = Firestore();

  FirebaseUser firebaseUser;
  Map<String, dynamic> userData = Map();

  bool isLoading = false;

  void signUp({@required Map<String, dynamic> userData, @required String pass, @required VoidCallback onSuccess, @required
      VoidCallback onFail}) {
    isLoading = true;
    notifyListeners();

    _auth
        .createUserWithEmailAndPassword(
            email: userData["email"], password: pass)
        .then((user) async {
          firebaseUser = user;

         await _saveUserData(userData);

          onSuccess();
          isLoading = false;
          notifyListeners();
    })
        .catchError((e) {
          onFail();
          isLoading = false;
          notifyListeners();
    });
  }

  Future signIn() async {
    isLoading = true;
    notifyListeners();

    await Future.delayed(Duration(seconds: 3));
    isLoading = false;
    notifyListeners();
  }

  void signOut() async{
    await _auth.signOut();
    userData = Map();
    firebaseUser = null;
    notifyListeners();
  }

  void recoverPass() {

  }

  bool isLoggedIn() {
    return firebaseUser != null;
  }


  //salvara os dados do usuario
  Future<Null> _saveUserData(Map<String, dynamic> userData) async {
    this.userData = userData;
     await Firestore.instance.collection("user").document(firebaseUser.uid).setData(userData);
  }

}