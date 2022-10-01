import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_login_signup/screens/newSalesHomePage.dart';
class currentsales extends StatefulWidget {
  const currentsales({Key? key}) : super(key: key);

  @override
  _currentsalesState createState() => _currentsalesState();
}

class _currentsalesState extends State<currentsales> {

  final payItems = ['Cash' , 'Credit Card' , 'Online Payment'];
  String? value;
  var basic= 2000;


  final  listItem = [
    "Shop A" , "Shop B" ,"Shop C" ,"Shop D" , "Shop E"
  ];
  String? values;
  String? selectedValue;

  List<String> items = [
    'Credit',
    'Cash',
    'Cheque',
  ];


  double myController1=0 ;
  double myController2=0;
  double myController3=0;
  String myControllerID = "";

  final Controller1 = TextEditingController();
  final Controller2 = TextEditingController();
  final Controller3 = TextEditingController();
  final Controller4 = TextEditingController();
  final Controller5 = TextEditingController();
  final Controller6 = TextEditingController();
  final Controller7 = TextEditingController();
  final Controller8 = TextEditingController();
  final Controller9 = TextEditingController();
  final Controller10 = TextEditingController();
  final Controller11 = TextEditingController();
  final Controller12 = TextEditingController();
  final Controller13 = TextEditingController();
  final Controller14 = TextEditingController();
  final Controller15 = TextEditingController();
  final Controller16 = TextEditingController();

  double tot=0;

  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    //print("######################################################################"+ auth.currentUser?.uid);

    return SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0,0,0,0),
                  child: Container(
                    // decoration: BoxDecoration(
                    //     shape: BoxShape.rectangle,
                    //     borderRadius: BorderRadius.circular(6),
                    //     border: Border.all(
                    //       color: Colors.black,
                    //       width: 4,
                    //     )
                    // ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          Card(
                              child: ListTile(
                                  title: Text(
                                    'Current Sale',
                                    style: TextStyle(
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blueGrey,
                                    ),
                                    textAlign: TextAlign.center,
                                  ))),
                          SizedBox(
                            height: 6,
                          ),
                          Container(
                            width: 300,
                            height: 40,
                            padding: EdgeInsets.symmetric(horizontal: 10 , vertical: 2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              //border: Border.all(color: Colors.black , width: 2),
                            ),
                            child: FutureBuilder<QuerySnapshot>(
                              future: FirebaseFirestore.instance.collection('Shops').get(),
                              builder: (context, snapshot) {
                                if (snapshot.hasError) {
                                  return const Text("Something went wrong");
                                }

                                if (snapshot.hasData) {
                                  final List<DocumentSnapshot> documents = snapshot.data!.docs;
                                  return
                                    DropdownButtonHideUnderline(
                                      child: DropdownButton2(
                                        isExpanded: true,
                                        hint: Row(
                                          children: const [
                                            Icon(
                                              Icons.list,
                                              size: 16,
                                              color: Colors.white,
                                            ),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Expanded(
                                              child: Text(
                                                'Select Shop',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                        items:
                                        //=============
                                        documents
                                            .map((item) => DropdownMenuItem<String>(
                                          value: item.id,
                                          child: Text(
                                            item.id,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ))
                                            .toList(),
                                        //===============
                                        value: selectedValue,
                                        onChanged: (value) {
                                          for (var item in documents) {
                                            print(item.id);
                                            if (value == item.id){
                                              print(item.id);
                                              myControllerID = item.id;
                                            }

                                          }
                                        },
                                        icon: const Icon(
                                          Icons.arrow_forward_ios_outlined,
                                        ),
                                        iconSize: 14,
                                        iconEnabledColor: Colors.white,
                                        iconDisabledColor: Colors.grey,
                                        buttonHeight: 50,
                                        buttonWidth: 260,
                                        buttonPadding:
                                        const EdgeInsets.only(left: 14, right: 14),
                                        buttonDecoration: BoxDecoration(
                                          gradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Colors.lightBlueAccent,
                                                Colors.blueGrey
                                              ]),
                                          borderRadius: BorderRadius.circular(14),
                                          border: Border.all(
                                            color: Colors.black26,
                                          ),
                                        ),
                                        buttonElevation: 2,
                                        itemHeight: 40,
                                        //itemWidth: 260,
                                        itemPadding:
                                        const EdgeInsets.only(left: 14, right: 14),
                                        dropdownMaxHeight: 200,
                                        dropdownPadding: null,
                                        dropdownDecoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(14),
                                          color: Colors.blueGrey,
                                        ),
                                        dropdownElevation: 8,
                                        scrollbarRadius: const Radius.circular(40),
                                        scrollbarThickness: 6,
                                        scrollbarAlwaysShow: true,
                                      ),
                                    );

                                }
                                return const Text("loading");
                              },
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 23, 0),
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    shape: BoxShape.rectangle,
                                    border: Border.all(width: 0.5 , color: Colors.black),
                                  ),
                                  height: 40,
                                  width: 80,
                                  margin: EdgeInsets.all(10),
                                  child: Text(
                                    "Quantity",
                                    style: TextStyle(fontSize: 12 , fontWeight: FontWeight.bold , color: Colors.deepOrange),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 12, 0),
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    shape: BoxShape.rectangle,
                                    border: Border.all(width: 0.5 , color: Colors.black),
                                  ),
                                  height: 40,
                                  width: 80,
                                  margin: EdgeInsets.all(10),
                                  child: Text(
                                    "Unit Price",
                                    style: TextStyle(fontSize: 12 , fontWeight: FontWeight.bold , color: Colors.deepOrange),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    shape: BoxShape.rectangle,
                                    border: Border.all(width: 2 , color: Colors.black),
                                  ),
                                  height: 40,
                                  width: 80,
                                  margin: EdgeInsets.all(10),
                                  child: Text(
                                    "Gurudeva",
                                    style: TextStyle(fontSize: 10 , fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),

                              Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  shape: BoxShape.rectangle,
                                  border: Border.all(width: 2 , color: Colors.black),
                                ),
                                height: 40,
                                width: 80,
                                margin: EdgeInsets.all(10),
                                child: TextField(
                                  controller:Controller1,
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  shape: BoxShape.rectangle,
                                  border: Border.all(width: 2 , color: Colors.black),
                                ),
                                height: 40,
                                width: 80,
                                margin: EdgeInsets.all(10),
                                child: TextField(
                                  controller:Controller2,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    shape: BoxShape.rectangle,
                                    border: Border.all(width: 2 , color: Colors.black),
                                  ),
                                  height: 40,
                                  width: 80,
                                  margin: EdgeInsets.all(10),
                                  child: Text(
                                    "Six O\' Mega",
                                    style: TextStyle(fontSize: 10 , fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),

                              Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  shape: BoxShape.rectangle,
                                  border: Border.all(width: 2 , color: Colors.black),
                                ),
                                height: 40,
                                width: 80,
                                margin: EdgeInsets.all(10),
                                child: TextField(
                                  controller:Controller3,
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  shape: BoxShape.rectangle,
                                  border: Border.all(width: 2 , color: Colors.black),
                                ),
                                height: 40,
                                width: 80,
                                margin: EdgeInsets.all(10),
                                child: TextField(
                                  controller:Controller4,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    shape: BoxShape.rectangle,
                                    border: Border.all(width: 2 , color: Colors.black),
                                  ),
                                  height: 40,
                                  width: 80,
                                  margin: EdgeInsets.all(10),
                                  child: Text(
                                    "Six O\' 50",
                                    style: TextStyle(fontSize: 10 , fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),

                              Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  shape: BoxShape.rectangle,
                                  border: Border.all(width: 2 , color: Colors.black),
                                ),
                                height: 40,
                                width: 80,
                                margin: EdgeInsets.all(10),
                                child: TextField(
                                  controller:Controller5,
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  shape: BoxShape.rectangle,
                                  border: Border.all(width: 2 , color: Colors.black),
                                ),
                                height: 40,
                                width: 80,
                                margin: EdgeInsets.all(10),
                                child: TextField(
                                  controller:Controller6,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    shape: BoxShape.rectangle,
                                    border: Border.all(width: 2 , color: Colors.black),
                                  ),
                                  height: 40,
                                  width: 80,
                                  margin: EdgeInsets.all(10),
                                  child: Text(
                                    "Six O\'",
                                    style: TextStyle(fontSize: 10 , fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),

                              Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  shape: BoxShape.rectangle,
                                  border: Border.all(width: 2 , color: Colors.black),
                                ),
                                height: 40,
                                width: 80,
                                margin: EdgeInsets.all(10),
                                child: TextField(
                                  controller:Controller7,
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  shape: BoxShape.rectangle,
                                  border: Border.all(width: 2 , color: Colors.black),
                                ),
                                height: 40,
                                width: 80,
                                margin: EdgeInsets.all(10),
                                child: TextField(
                                  controller:Controller8,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    shape: BoxShape.rectangle,
                                    border: Border.all(width: 2 , color: Colors.black),
                                  ),
                                  height: 40,
                                  width: 80,
                                  margin: EdgeInsets.all(10),
                                  child: Text(
                                    "Paramitha Red",
                                    style: TextStyle(fontSize: 10 , fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),

                              Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  shape: BoxShape.rectangle,
                                  border: Border.all(width: 2 , color: Colors.black),
                                ),
                                height: 40,
                                width: 80,
                                margin: EdgeInsets.all(10),
                                child: TextField(
                                  controller:Controller9,
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  shape: BoxShape.rectangle,
                                  border: Border.all(width: 2 , color: Colors.black),
                                ),
                                height: 40,
                                width: 80,
                                margin: EdgeInsets.all(10),
                                child: TextField(
                                  controller:Controller10,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    shape: BoxShape.rectangle,
                                    border: Border.all(width: 2 , color: Colors.black),
                                  ),
                                  height: 40,
                                  width: 80,
                                  margin: EdgeInsets.all(10),
                                  child: Text(
                                    "Paramitha Green",
                                    style: TextStyle(fontSize: 10 , fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),

                              Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  shape: BoxShape.rectangle,
                                  border: Border.all(width: 2 , color: Colors.black),
                                ),
                                height: 40,
                                width: 80,
                                margin: EdgeInsets.all(10),
                                child: TextField(
                                  controller:Controller11,
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  shape: BoxShape.rectangle,
                                  border: Border.all(width: 2 , color: Colors.black),
                                ),
                                height: 40,
                                width: 80,
                                margin: EdgeInsets.all(10),
                                child: TextField(
                                  controller:Controller12,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    shape: BoxShape.rectangle,
                                    border: Border.all(width: 2 , color: Colors.black),
                                  ),
                                  height: 40,
                                  width: 80,
                                  margin: EdgeInsets.all(10),
                                  child: Text(
                                    "Jasmine",
                                    style: TextStyle(fontSize: 10 , fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),

                              Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  shape: BoxShape.rectangle,
                                  border: Border.all(width: 2 , color: Colors.black),
                                ),
                                height: 40,
                                width: 80,
                                margin: EdgeInsets.all(10),
                                child: TextField(
                                  controller:Controller13,
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  shape: BoxShape.rectangle,
                                  border: Border.all(width: 2 , color: Colors.black),
                                ),
                                height: 40,
                                width: 80,
                                margin: EdgeInsets.all(10),
                                child: TextField(
                                  controller:Controller14,
                                ),
                              ),
                            ],
                          ),
                          FutureBuilder<QuerySnapshot>(
                          future: FirebaseFirestore.instance.collection('Shops').get(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return const Text("Something went wrong");
                            }

                            if (snapshot.hasData) {
                              final List<
                                  DocumentSnapshot> documents = snapshot.data!
                                  .docs;
                              for (var item in documents) {
                                print(item.id);
                                if (myControllerID == item.id) {
                                  print(item.id);
                                  //myControllerID = item.id;
                                  myController3 = item["SalesVal"].toDouble();
                                }
                              }
                              return Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceAround,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        shape: BoxShape.rectangle,
                                        border: Border.all(
                                            width: 2, color: Colors.black),
                                      ),
                                      height: 40,
                                      width: 80,
                                      margin: EdgeInsets.all(10),
                                      child: Text(
                                        "Araliya",
                                        style: TextStyle(fontSize: 10,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),

                                  Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      shape: BoxShape.rectangle,
                                      border: Border.all(
                                          width: 2, color: Colors.black),
                                    ),
                                    height: 40,
                                    width: 80,
                                    margin: EdgeInsets.all(10),
                                    child: TextField(
                                      controller: Controller15,
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      shape: BoxShape.rectangle,
                                      border: Border.all(
                                          width: 2, color: Colors.black),
                                    ),
                                    height: 40,
                                    width: 80,
                                    margin: EdgeInsets.all(10),
                                    child: TextField(
                                      controller: Controller16,
                                    ),
                                  ),
                                ],
                              );
                            }
                            return const Text("loading");
                          }),
                          FutureBuilder<QuerySnapshot>(
                              future: FirebaseFirestore.instance.collection('SalesPerson').get(),
                              builder: (context, snapshot) {
                                if (snapshot.hasError) {
                                  return const Text("Something went wrong");
                                }

                                if (snapshot.hasData) {
                                  final List<
                                      DocumentSnapshot> documents = snapshot.data!.docs;
                                  for (var item in documents) {
                                    print(item.id);
                                    if (auth.currentUser?.uid == item.id){
                                      print(item.id);
                                      //myControllerID = item.id;
                                      myController1 = item["SalesVal"].toDouble();
                                      myController2 = item["Salary"].toDouble();
                                    }
                                  }
                                  return Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            160, 0, 0, 0),
                                        child: Container(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                5),
                                            shape: BoxShape.rectangle,
                                            border: Border.all(
                                                width: 2, color: Colors.black),
                                          ),
                                          height: 40,
                                          width: 80,
                                          margin: EdgeInsets.all(10),
                                          child: Text(
                                            "Total : ",
                                            style: TextStyle(fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              5),
                                          shape: BoxShape.rectangle,
                                          border: Border.all(
                                              width: 2, color: Colors.black),
                                        ),
                                        height: 40,
                                        width: 80,
                                        margin: EdgeInsets.all(10),

                                        child: Text(tot.toString()),
                                        // child: TextField(
                                        //
                                        // ),
                                      ),
                                    ],
                                  );
                                }
                                return const Text("loading");
                              }),

                          SizedBox(
                            height: 4,
                          ),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton.extended(
                                    shape: new RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(8.0),
                                    ),

                                    // style: TextButton.styleFrom(
                                    backgroundColor: Colors.blueGrey,
                                    onPressed: (){
                                      var a = double.parse(Controller1.text) * double.parse(Controller2.text);
                                      var b = double.parse(Controller3.text) * double.parse(Controller4.text);
                                      var c = double.parse(Controller5.text) * double.parse(Controller6.text);
                                      var d = double.parse(Controller7.text) * double.parse(Controller8.text);
                                      var e = double.parse(Controller9.text) * double.parse(Controller10.text);
                                      var f = double.parse(Controller11.text) * double.parse(Controller12.text);
                                      var g = double.parse(Controller13.text) * double.parse(Controller14.text);
                                      var h = double.parse(Controller15.text) * double.parse(Controller16.text);

                                      tot = a + b + c + d + e + f + g + h;

                                      setState(() {
                                       tot;
                                      });



                                      print("submitted");
                                      print(myControllerID);

                                      DocumentReference documentReference =
                                      FirebaseFirestore.instance.collection("Shops").doc(myControllerID);


                                      print(myController1-tot);
                                      Map<String, dynamic> salesVal = {
                                        "SalesVal":myController3+tot,
                                      };
                                      documentReference.update(salesVal).whenComplete(() {
                                        print("updated");
                                      });
                                      //===============================================================================

                                      DocumentReference documentReferenced =
                                      FirebaseFirestore.instance.collection("SalesPerson").doc(auth.currentUser?.uid);


                                      Map<String, dynamic> saled = {
                                        "SalesVal": tot+(myController1),
                                        "Salary":((tot/100)*10)+(myController2),
                                      };
                                      documentReferenced.update(saled).whenComplete(() {
                                        print("updated###");
                                      });


                                      //================================================================================
                                      CollectionReference users = FirebaseFirestore.instance.collection('Sales');


                                        // Call the user's CollectionReference to add a new user
                                         users
                                            .add({
                                           "Shop":(myControllerID),
                                           "SalesVal": tot,
                                           "Gurudeva": int.parse(Controller1.text),
                                           "SixOMega": int.parse(Controller3.text),
                                           "SixO50": int.parse(Controller5.text),
                                           "SixO": int.parse(Controller7.text),
                                           "ParamithaG": int.parse(Controller9.text),
                                           "ParamithaR": int.parse(Controller11.text),
                                           "Jasmine": int.parse(Controller13.text),
                                           "Araliya": int.parse(Controller15.text),
                                           "SPID":auth.currentUser?.uid,

                                        })
                                            .then((value) => print("Document Added"))
                                            .catchError((error) => print("Failed to add user: $error"));

                                    //  ==================================================================
                                      Navigator.push(
                                          context, MaterialPageRoute(builder: (context) => newSalesHome(title: 'newSalesHome',)));
                                    },
                                    label: Text(
                                        "Confirm Sale"
                                    )
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
    );
  }

  DropdownMenuItem<String> buildShopItem(String item) =>
      DropdownMenuItem(
          value: item,
          child: Text(
            item,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          )
      );

  DropdownMenuItem<String>  buildMenuItem(String item) =>
      DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      );
}
