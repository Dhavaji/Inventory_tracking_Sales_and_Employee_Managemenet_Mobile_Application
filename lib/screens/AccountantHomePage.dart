

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_signup/screens/welcomePage.dart';
import 'SalaryPage.dart';
import 'SalesThirdPage.dart';

class AccountantPage extends StatelessWidget {
  const AccountantPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    const Color(0xFF607D8B),
                    const Color(0xFF40C4FF),
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
          ),
            actions: [
              //list if widget in appbar actions
              PopupMenuButton(
                //don't specify icon if you want 3 dot menu
                color: Colors.lightBlue[900],
                itemBuilder: (context) => [
                  PopupMenuItem<int>(
                    value: 0,
                    child: Text(
                      "Logout",
                      style: TextStyle(color: Colors.white),
                    ),
                    // onTap: (){
                    //   _signOut();
                    // },
                  ),
                ],
                onSelected: (item) => {print(item)},
              ),
            ],
            bottom: TabBar(
              tabs: [
                Tab(text : "Salary" , icon : Icon(Icons.money)),
                Tab(text: "Sales", icon: Icon(Icons.account_balance),),
              ]
              ),
            title: Text("Bobby Marketing",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                  color: Colors.white,
                )),
          ),
          drawer: Drawer(
            child: ListView(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          const Color(0xFF607D8B),
                          const Color(0xFF40C4FF),
                        ],
                        begin: const FractionalOffset(0.0, 0.0),
                        end: const FractionalOffset(1.0, 0.0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp),
                  ),
                  accountName: Text("Tharindu Karunanayake"),
                  accountEmail: Text("Chief Executive Officer"),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor:
                    Theme.of(context).platform == TargetPlatform.iOS
                        ? Colors.blueGrey
                        : Colors.white,
                    child: Text(
                      "T",
                      style: TextStyle(fontSize: 40.0, color: Colors.blueGrey),
                    ),
                  ),
                ),
                ListTile(
                  title: Text("Update Username"),
                  trailing: Icon(Icons.arrow_forward),
                ),
                ListTile(
                  title: Text("Change Password"),
                  trailing: Icon(Icons.arrow_forward),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              SalaryPage(),
              SalesThird(),
            ],
          ),
        ),
      ),
    );
  }
  // void _signOut() async {
  //   await FirebaseAuth.instance.signOut();
  //   Navigator.push(
  //       context, MaterialPageRoute(builder: (context) => WelcomePage()));
  // }
}