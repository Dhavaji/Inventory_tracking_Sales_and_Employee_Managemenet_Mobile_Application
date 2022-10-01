import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login_signup/screens/welcomePage.dart';

import 'NavBar.dart';
import 'Profiles.dart';
import 'mymap.dart';
import 'saleshomepage.dart';
import 'package:flutter/material.dart';
import 'StoreManagement.dart';


class AppbarMenu extends StatefulWidget {
  const AppbarMenu({Key? key}) : super(key: key);

  @override
  _AppbarMenuState createState() => _AppbarMenuState();
}

class _AppbarMenuState extends State<AppbarMenu> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
          flexibleSpace: Container(
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
            PopupMenuButton(
              //don't specify icon if you want 3 dot menu
              color: Color(0xFF40C4FF),
              itemBuilder: (context) =>
              [
                PopupMenuItem<int>(
                  value: 0,
                  child: Text(
                    "Logout",
                    style: TextStyle(color: Colors.white),
                  ),
//                   onTap: () {
//                     _signOut();
// //jump to function
//                   },
                ),
              ],
              onSelected: (item) => {print(item)},
            ),
          ],
          bottom: TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 5,
            tabs: [
              Tab(icon: Icon(Icons.point_of_sale_sharp),
                  text: 'Sales Statistics'),
              Tab(icon: Icon(Icons.face), text: 'Profile'),
              Tab(icon: Icon(Icons.store), text: 'Store',),
              Tab(icon: Icon(Icons.map), text: 'Live Location',),
            ],
          ),
          elevation: 20,
          titleSpacing: 10,
          title: Text("Bobby Marketing"),
          centerTitle: true,
          backgroundColor: Color(0xFF363f93),
        ),
        body: TabBarView(
          children: [
            SalesHomePage(),
            ProfilePage(),
            StoreManager(),
            StreamBuilder(
              stream:
              FirebaseFirestore.instance.collection('location').snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                return ListView.builder(
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title:
                        Text(snapshot.data!.docs[index]['name'].toString()),
                        subtitle: Row(
                          children: [
                            Text(snapshot.data!.docs[index]['latitude']
                                .toString()),
                            SizedBox(
                              width: 20,
                            ),
                            Text(snapshot.data!.docs[index]['longitude']
                                .toString()),
                          ],
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.directions),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    MyMap(snapshot.data!.docs[index].id)));
                          },
                        ),
                      );
                    });
              },
            )
          ],
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