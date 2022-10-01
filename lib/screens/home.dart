import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_signup/screens/welcomePage.dart';
import 'update.dart';
import 'release.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multilevel_drawer/multilevel_drawer.dart';


class HomeWidget extends StatelessWidget {
  //const HomeWidget({Key? key}) : super(key: key);

  final Stream<QuerySnapshot> users = FirebaseFirestore.instance.collection('Products').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                onTap: (){
                  _signOut();
                },
              ),
            ],
            onSelected: (item) => {print(item)},
          ),
        ],
        bottom: PreferredSize(
          child: Text(
            "Store Management",
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Colors.white,
            ),
          ),
          preferredSize: Size.fromHeight(40),
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
      body: Column(
        children: <Widget>[
          Card(
              child: ListTile(
                  title: Text(
            'Current Stock',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey,
            ),
            textAlign: TextAlign.center,
          ))),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: <Widget>[
                //Card 1
                Card(
                    color: Colors.cyan[400],
                    margin: EdgeInsets.only(
                        left: 10.0, right: 5.0, top: 20.0, bottom: 20.0),
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            flex: 8,
                            child: Padding(
                              padding: EdgeInsets.only(top: 40.0,left: 70),
                              child: StreamBuilder<QuerySnapshot>(
                                stream:users,
                                builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot,){
                                    if(snapshot.hasError){
                                      return Text("Something Went Wrong");
                                    }


                                    final data = snapshot.requireData;

                                    return ListView.builder(
                                      itemCount:data.size,
                                      itemBuilder: (context,index){
                                        return Text('${data.docs[index]['Gurudeva']}',
                                          style: TextStyle(
                                            fontSize: 50,
                                            color: Colors.white,
                                          ),
                                        );
                                      },


                                    );

                              },)
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              'Gurudeva',
                              style: GoogleFonts.roboto(
                                  color: Colors.white,
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    )),
                // Card 2
                Card(
                  color: Colors.teal[400],
                  margin: EdgeInsets.only(
                      left: 5.0, right: 10.0, top: 20.0, bottom: 20.0),
                  elevation: 10.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            flex: 8,
                            child: Padding(
                                padding: EdgeInsets.only(top: 40.0,left: 70),
                                child: StreamBuilder<QuerySnapshot>(
                                  stream:users,
                                  builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot,){
                                    if(snapshot.hasError){
                                      return Text("Something Went Wrong");
                                    }

                                    final data = snapshot.requireData;

                                    return ListView.builder(
                                      itemCount:data.size,
                                      itemBuilder: (context,index){
                                        return Text('${data.docs[index]['SixOMega']}',
                                          style: TextStyle(
                                            fontSize: 50,
                                            color: Colors.white,
                                          ),
                                        );
                                      },


                                    );

                                  },)
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              'Six O\' Mega',
                              style: GoogleFonts.roboto(
                                  color: Colors.white,
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      )),
                ),
                //Card 3
                Card(
                  color: Colors.purple[300],
                  margin: EdgeInsets.only(
                      left: 10.0, right: 5.0, top: 10.0, bottom: 20.0),
                  elevation: 10.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            flex: 8,
                            child: Padding(
                                padding: EdgeInsets.only(top: 40.0,left: 70),
                                child: StreamBuilder<QuerySnapshot>(
                                  stream:users,
                                  builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot,){
                                    if(snapshot.hasError){
                                      return Text("Something Went Wrong");
                                    }

                                    final data = snapshot.requireData;

                                    return ListView.builder(
                                      itemCount:data.size,
                                      itemBuilder: (context,index){
                                        return Text('${data.docs[index]['SixO50']}',
                                          style: TextStyle(
                                            fontSize: 50,
                                            color: Colors.white,
                                          ),
                                        );
                                      },


                                    );

                                  },)
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              'Six O\' 50',
                              style: GoogleFonts.roboto(
                                  color: Colors.white,
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      )),
                ),
                //Card 4
                Card(
                  margin: EdgeInsets.only(
                      left: 5.0, right: 10.0, top: 10.0, bottom: 20.0),
                  color: Colors.indigo[400],
                  elevation: 10.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            flex: 8,
                            child: Padding(
                                padding: EdgeInsets.only(top: 40.0,left: 70),
                                child: StreamBuilder<QuerySnapshot>(
                                  stream:users,
                                  builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot,){
                                    if(snapshot.hasError){
                                      return Text("Something Went Wrong");
                                    }

                                    final data = snapshot.requireData;

                                    return ListView.builder(
                                      itemCount:data.size,
                                      itemBuilder: (context,index){
                                        return Text('${data.docs[index]['SixO']}',
                                          style: TextStyle(
                                            fontSize: 50,
                                            color: Colors.white,
                                          ),
                                        );
                                      },


                                    );

                                  },)
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              'Six O\'',
                              style: GoogleFonts.roboto(
                                  color: Colors.white,
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      )),
                ),
                //Card 5
                Card(
                    color: Colors.orange[300],
                    margin: EdgeInsets.only(
                        left: 10.0, right: 5.0, top: 20.0, bottom: 20.0),
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            flex: 8,
                            child: Padding(
                                padding: EdgeInsets.only(top: 40.0,left: 70),
                                child: StreamBuilder<QuerySnapshot>(
                                  stream:users,
                                  builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot,){
                                    if(snapshot.hasError){
                                      return Text("Something Went Wrong");
                                    }

                                    final data = snapshot.requireData;

                                    return ListView.builder(
                                      itemCount:data.size,
                                      itemBuilder: (context,index){
                                        return Text('${data.docs[index]['ParamithaG']}',
                                          style: TextStyle(
                                            fontSize: 50,
                                            color: Colors.white,
                                          ),
                                        );
                                      },


                                    );

                                  },)
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              'Paramitha (R)',
                              style: GoogleFonts.roboto(
                                  color: Colors.white,
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    )),
                // Card 6
                Card(
                  color: Colors.red[300],
                  margin: EdgeInsets.only(
                      left: 5.0, right: 10.0, top: 20.0, bottom: 20.0),
                  elevation: 10.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            flex: 8,
                            child: Padding(
                                padding: EdgeInsets.only(top: 40.0,left: 70),
                                child: StreamBuilder<QuerySnapshot>(
                                  stream:users,
                                  builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot,){
                                    if(snapshot.hasError){
                                      return Text("Something Went Wrong");
                                    }

                                    final data = snapshot.requireData;

                                    return ListView.builder(
                                      itemCount:data.size,
                                      itemBuilder: (context,index){
                                        return Text('${data.docs[index]['ParamithaR']}',
                                          style: TextStyle(
                                            fontSize: 50,
                                            color: Colors.white,
                                          ),
                                        );
                                      },


                                    );

                                  },)
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              'Paramitha (G)',
                              style: GoogleFonts.roboto(
                                  color: Colors.white,
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      )),
                ),
                //Card 7
                Card(
                    color: Colors.brown[300],
                    margin: EdgeInsets.only(
                        left: 10.0, right: 5.0, top: 20.0, bottom: 20.0),
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            flex: 8,
                            child: Padding(
                                padding: EdgeInsets.only(top: 40.0,left: 70),
                                child: StreamBuilder<QuerySnapshot>(
                                  stream:users,
                                  builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot,){
                                    if(snapshot.hasError){
                                      return Text("Something Went Wrong");
                                    }

                                    final data = snapshot.requireData;

                                    return ListView.builder(
                                      itemCount:data.size,
                                      itemBuilder: (context,index){
                                        return Text('${data.docs[index]['Jasmine']}',
                                          style: TextStyle(
                                            fontSize: 50,
                                            color: Colors.white,
                                          ),
                                        );
                                      },


                                    );

                                  },)
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              'Jasmine',
                              style: GoogleFonts.roboto(
                                  color: Colors.white,
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    )),
                // Card 8
                Card(
                  color: Colors.blueGrey[400],
                  margin: EdgeInsets.only(
                      left: 5.0, right: 10.0, top: 20.0, bottom: 20.0),
                  elevation: 10.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            flex: 8,
                            child: Padding(
                                padding: EdgeInsets.only(top: 40.0,left: 70),
                                child: StreamBuilder<QuerySnapshot>(
                                  stream:users,
                                  builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot,){
                                    if(snapshot.hasError){
                                      return Text("Something Went Wrong");
                                    }

                                    final data = snapshot.requireData;

                                    return ListView.builder(
                                      itemCount:data.size,
                                      itemBuilder: (context,index){
                                        return Text('${data.docs[index]['Araliya']}',
                                          style: TextStyle(
                                            fontSize: 50,
                                            color: Colors.white,
                                          ),
                                        );
                                      },


                                    );

                                  },)
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              'Araliya',
                              style: GoogleFonts.roboto(
                                  color: Colors.white,
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
          Wrap(children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 35.0, top: 5.0),
              child: RaisedButton(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(8.0),
                ),
                child: Text(
                  'Update Stock',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                color: Colors.blueGrey,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return updateWidget();
                  }));
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 35.0, top: 5.0),
              child: RaisedButton(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(8.0),
                ),
                child: Text(
                  'Release Stock',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                color: Colors.blueGrey,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ReleaseWidget();
                  }));
                },
              ),
            ),
          ]),
        ],
      ),
    );
  }

  void _signOut() async {
    await FirebaseAuth.instance.signOut();
    //Navigator.push(
      //  context, MaterialPageRoute(builder: (context) => WelcomePage(title: "HomePage",)));
  }
}
