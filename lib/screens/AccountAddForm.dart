import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';




class AccountAdd extends StatefulWidget {
  const AccountAdd({Key? key}) : super(key: key);

  @override
  _AccountAddState createState() => _AccountAddState();
}

class _AccountAddState extends State<AccountAdd> {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController nicController = TextEditingController();
  TextEditingController tpController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Service service = Service();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
        appBar:  AppBar(
          actions: [
            //list if widget in appbar actions
            PopupMenuButton(
              //don't specify icon if you want 3 dot menu
              color: Color(0xFF363f93),
              itemBuilder: (context) => [
                PopupMenuItem<int>(
                  value: 0,
                  child: Text(
                    "Logout",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
              onSelected: (item) => {print(item)},
            ),
          ],
          bottom: PreferredSize(
            child: Text(
              "User Registration",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.white,
              ),
            ),
            preferredSize: Size.fromHeight(30),
          ),
          title: Text("Bobby Marketing" ,
            textAlign: TextAlign.center,),
          backgroundColor:  Color(0xFF363f93),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(
            vertical: 50,
            horizontal: 10,
          ),
          child: Form(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    controller:nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller:nicController,
                    decoration: InputDecoration(
                      labelText: 'NIC',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller:addressController,
                    decoration: InputDecoration(
                      labelText: 'Address',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller:tpController,
                    decoration: InputDecoration(
                      labelText: 'Contact Number',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller:emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller:passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {

                  final auth = FirebaseAuth.instance;
                  auth.createUserWithEmailAndPassword(
                      email: emailController.text,
                      password: passwordController.text).then((value){
                    FirebaseFirestore.instance.collection('SalesPerson').doc(value.user!.uid).set({
                      "email": value.user!.email,
                      "uid":value.user!.uid,

                    });
                  });

                  nameController.clear();
                  emailController.clear();
                  passwordController.clear();
                  addressController.clear();
                  nicController.clear();
                  tpController.clear();
                },
                child:Text(
                  "Add User",
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                  ),

                ),
              style: ElevatedButton.styleFrom(
                onPrimary: Colors.white,
                shadowColor: Colors.red,
                elevation: 5,
              ),
            ),
            SizedBox(
              height: 80,
            ),
          ],

        )
    ),
    );
  }
}
