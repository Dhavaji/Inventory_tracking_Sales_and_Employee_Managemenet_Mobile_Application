import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_signup/screens/location.dart';
import 'package:flutter_login_signup/screens/welcomePage.dart';
import 'Sale.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class newSalesHome extends StatefulWidget {
  const newSalesHome({ required this.title}) ;

  final String title;


  @override
  _newSalesHomeState createState() => _newSalesHomeState();
}

class _newSalesHomeState extends State<newSalesHome> {
  String myController1 = "";
  String myController2 = "";
  String myController3 = "";
  String myController4 = "";
  String myController5 = "";
  String myController6 = "";
  String myController7 = "";
  String myController8 = "";
  double myController9 = 0;
  String myControllerID = "";

  final Controller1 = TextEditingController();
  final Controller2 = TextEditingController();
  final Controller3 = TextEditingController();
  final Controller4 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    return  Scaffold(
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
                // onTap: (){
                //   _signOut();
                // },
              ),
            ],
            onSelected: (item) => {print(item)},
          ),
        ],
        bottom: PreferredSize(
          child: Text(
            "Sales Management",
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
            ListTile(
              title: Text("Location Settings"),
              trailing: Icon(Icons.arrow_forward),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder:(_){
                      return locationWidget();
                    }
                ));
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:<Widget> [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  child: Text(
                    "My Stock",
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              // ElevatedButton(
              //   style: TextButton.styleFrom(
              //     backgroundColor: Colors.red,
              //       fixedSize: Size.fromHeight(30),
              // ),
              //   onPressed: (){
              //   },
              //   child: Text(
              //     "Alert!!!",
              //     style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              //   ),
              // ),
            ],
          ),
          FutureBuilder<QuerySnapshot>(
              future: FirebaseFirestore.instance.collection('SalesPerson').get(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Text("Something went wrong");
                }

                if (snapshot.hasData) {
                  final List<DocumentSnapshot> documents = snapshot.data!
                      .docs;
                  for (var item in documents) {
                    print(item.id);
                    if (auth.currentUser?.uid == item.id) {
                      print(item.id);
                      //myControllerID = item.id;
                      myController9 = item["Salary"].toDouble();
                    }
                  }
                  return Card(
                    child: ListTile(
                      title: Text(
                        "Salary Tracker : LKR. $myController9 ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                }
                return             CircularProgressIndicator(

                );
              }),
          FutureBuilder<QuerySnapshot>(
              future: FirebaseFirestore.instance.collection('SalesPerson').get(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Text("Something went wrong");
                }

                if (snapshot.hasData) {
                  final List<DocumentSnapshot> documents = snapshot.data!
                      .docs;
                  for (var item in documents) {
                    var value=auth.currentUser?.uid;
                    if (value == item.id){
                      print(item.id);
                      myController1 = item["Gurudeva"].toString();
                      myController2 = item["SixOMega"].toString();
                      myController3 = item["SixO50"].toString();
                      myController4 = item["SixO"].toString();
                      myController5 = item["ParamithaR"].toString();
                      myController6 = item["ParamithaG"].toString();
                      myController7 = item["Jasmine"].toString();
                      myController8 = item["Araliya"].toString();
                    }

                  }
                  return Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      children: <Widget>[
                        //Card 1
                        Card(
                            color: Colors.cyan[400],
                            margin: EdgeInsets.only(
                                left: 10.0,
                                right: 5.0,
                                top: 20.0,
                                bottom: 20.0),
                            elevation: 10.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                            child: Align(
                              alignment: Alignment.center,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment
                                    .center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Expanded(
                                    flex: 8,
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 30.0),
                                      child: Text(
                                        myController1,
                                        style: TextStyle(
                                          fontSize: 50,
                                          color: Colors.white,
                                        ),
                                      ),
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
                              left: 5.0,
                              right: 10.0,
                              top: 20.0,
                              bottom: 20.0),
                          elevation: 10.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                          child: Align(
                              alignment: Alignment.center,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment
                                    .center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Expanded(
                                      flex: 8,
                                      child: Padding(
                                        padding: EdgeInsets.only(top: 30.0),
                                        child: Text(
                                          myController2,
                                          style: TextStyle(
                                            fontSize: 50,
                                            color: Colors.white,
                                          ),
                                        ),
                                      )),
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
                              left: 10.0,
                              right: 5.0,
                              top: 10.0,
                              bottom: 20.0),
                          elevation: 10.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                          child: Align(
                              alignment: Alignment.center,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment
                                    .center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Expanded(
                                    flex: 8,
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 30.0),
                                      child: Text(
                                        myController3,
                                        style: TextStyle(
                                          fontSize: 50,
                                          color: Colors.white,
                                        ),
                                      ),
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
                              left: 5.0,
                              right: 10.0,
                              top: 10.0,
                              bottom: 20.0),
                          color: Colors.indigo[400],
                          elevation: 10.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                          child: Align(
                              alignment: Alignment.center,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment
                                    .center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Expanded(
                                      flex: 8,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 30.0),
                                        child: Text(
                                          myController4,
                                          style: TextStyle(
                                            fontSize: 50,
                                            color: Colors.white,
                                          ),
                                        ),
                                      )),
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
                                left: 10.0,
                                right: 5.0,
                                top: 20.0,
                                bottom: 20.0),
                            elevation: 10.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                            child: Align(
                              alignment: Alignment.center,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment
                                    .center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Expanded(
                                    flex: 8,
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 30.0),
                                      child: Text(
                                        myController5,
                                        style: TextStyle(
                                          fontSize: 50,
                                          color: Colors.white,
                                        ),
                                      ),
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
                              left: 5.0,
                              right: 10.0,
                              top: 20.0,
                              bottom: 20.0),
                          elevation: 10.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                          child: Align(
                              alignment: Alignment.center,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment
                                    .center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Expanded(
                                      flex: 8,
                                      child: Padding(
                                        padding: EdgeInsets.only(top: 30.0),
                                        child: Text(
                                          myController6,
                                          style: TextStyle(
                                            fontSize: 50,
                                            color: Colors.white,
                                          ),
                                        ),
                                      )),
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
                                left: 10.0,
                                right: 5.0,
                                top: 20.0,
                                bottom: 20.0),
                            elevation: 10.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                            child: Align(
                              alignment: Alignment.center,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment
                                    .center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Expanded(
                                    flex: 8,
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 30.0),
                                      child: Text(
                                        myController7,
                                        style: TextStyle(
                                          fontSize: 50,
                                          color: Colors.white,
                                        ),
                                      ),
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
                              left: 5.0,
                              right: 10.0,
                              top: 20.0,
                              bottom: 20.0),
                          elevation: 10.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                          child: Align(
                              alignment: Alignment.center,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment
                                    .center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Expanded(
                                      flex: 8,
                                      child: Padding(
                                        padding: EdgeInsets.only(top: 30.0),
                                        child: Text(
                                          myController8,
                                          style: TextStyle(
                                            fontSize: 50,
                                            color: Colors.white,
                                          ),
                                        ),
                                      )),
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
                  );
                }
                return             CircularProgressIndicator(

                );}
          ),
          SizedBox(
            height: 6,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton.extended(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(8.0),
                    ),

                    // style: TextButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                    // fixedSize: Size.fromHeight(50)
                    //                                 ),
                    onPressed: (){
                      showDialog(context: context, builder: (context){
                        return Dialog(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                          elevation: 16,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              child: ListView(
                                shrinkWrap: true,
                                children: <Widget>[
                                  SizedBox(height: 15,),
                                  Center(child: Text("Add New Shop" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20),),),
                                  SizedBox(height: 10,),
                                  TextField(
                                    controller: Controller1,
                                    decoration: InputDecoration(
                                        labelText: "Shop Name:",
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(20),
                                        )
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  TextField(
                                    controller: Controller2,
                                    decoration: InputDecoration(
                                        labelText: "Address:",
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(20),
                                        )
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  TextField(
                                    controller: Controller3,
                                    decoration: InputDecoration(
                                        labelText: "Telephone:",
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(20),
                                        )
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  TextField(
                                    controller: Controller4,
                                    decoration: InputDecoration(
                                        labelText: "Owner Name:",
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(20),
                                        )
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  FloatingActionButton.extended(
                                      backgroundColor: Colors.blueGrey,
                                      onPressed: (){
                                        DocumentReference documentReference =
                                        FirebaseFirestore.instance.collection("Shops").doc(Controller1.text);

                                        Map<String, dynamic> shops = {
                                          "name":Controller1.text,
                                          "Address":Controller2.text,
                                          "Telephone":Controller3.text,
                                          "Owner":Controller4.text,
                                          "SalesVal":"0",
                                        };
                                        documentReference.set(shops).whenComplete(() {
                                          print("updated");
                                        });
                                      },
                                      label: Text("Submit",
                                      )),
                                ],
                              ),
                            ),
                          ),
                        );
                      });

                    }, label: Text("Add New Shop")),
                FloatingActionButton.extended(
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(8.0),
                  ),

                  // style: TextButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder:(_){
                          return Sales();
                        }
                    ));
                  } , label: Text("        Bill        "),
                ),
              ],
            ),
          ),
        ],
      ),
    );


  }
  // void _signOut() async {
  //   await FirebaseAuth.instance.signOut();
  //   Navigator.push(
  //       context, MaterialPageRoute(builder: (context) => WelcomePage()));
  // }
}

