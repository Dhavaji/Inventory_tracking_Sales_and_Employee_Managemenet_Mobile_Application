import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_signup/screens/AppBar.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter_login_signup/screens/SalesHome.dart';
import 'package:flutter_login_signup/screens/newSalesHomePage.dart';

import 'model/user_model.dart';
import 'screens/home.dart';

class ServiceAd {
  final auth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;


  createUser(email, password, context) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      error(context, e);
    }
  }


  loginUser(email, password, context) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password).then((value){
        Navigator.push(
            context, MaterialPageRoute(builder: (context) =>AppbarMenu()));
      });
    } catch (e) {
      error(context, "Email and the password are not matching");
    }
  }

  error(context, e) {
    // showDialog(
    //     context: context,
    //     builder: (context) {
    //       return AlertDialog(
    //         title: Text("Error"),
    //         content: Text(e.toString()),
    //       );
    //     });
    Alert(
      context: context,
      type: AlertType.error,
      title: e,
      buttons: [
        DialogButton(
          child: Text(
            "OK",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
  }
}