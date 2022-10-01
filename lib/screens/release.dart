import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

class ReleaseWidget extends StatefulWidget {
  @override
  State<ReleaseWidget> createState() => _ReleaseWidgetState();
}

class _ReleaseWidgetState extends State<ReleaseWidget> {
  final _formKey = GlobalKey<FormBuilderState>();

  FlutterLocalNotificationsPlugin? localNotification;

  @override
  void initState() {
    var androidInitialize = new AndroidInitializationSettings('ic_launcher');
    var initializationSettings = new InitializationSettings(android: androidInitialize);
    localNotification = new FlutterLocalNotificationsPlugin();
    localNotification?.initialize(initializationSettings);

    super.initState();
  }

  Future _showNotification() async {
    var androidDetails = new AndroidNotificationDetails("channelId", "Local Notification",importance: Importance.high);
    var generalNotificationDetails = new NotificationDetails(android: androidDetails);
    await localNotification?.show(0, "Attention", "Brand Gurudeva is low stock in stores", generalNotificationDetails);
  }

  late int a;

  String? selectedValue;

  String myController1 = "";
  String myController2 = "";
  String myController3 = "";
  String myController4 = "";
  String myController5 = "";
  String myController6 = "";
  String myController7 = "";
  String myController8 = "";
  String myControllerID = "";

  final Controller1 = TextEditingController();
  final Controller2 = TextEditingController();
  final Controller3 = TextEditingController();
  final Controller4 = TextEditingController();
  final Controller5 = TextEditingController();
  final Controller6 = TextEditingController();
  final Controller7 = TextEditingController();
  final Controller8 = TextEditingController();

  var documents2;

  //final Stream<QuerySnapshot> users = FirebaseFirestore.instance.collection('SalesPerson').snapshots();

  List<String> items = [
    'Sales Person 1',
    'Sales Person 2',
    'Sales Person 3',
    'Sales Person 4',
    'Sales Person 5',
    'Sales Person 6',
    'Sales Person 7',
    'Sales Person 8',
  ];

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore.instance
        .collection('Products')
        .doc("1Z1Y2kvIf7bBl8EaFTm8")
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        documents2 = documentSnapshot.data() ;
        print('Document exists on the database');
      }
    });

    selectPerson(){

    }


    return Scaffold(
      resizeToAvoidBottomInset: false,
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
        backgroundColor: Colors.lightBlue[900],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Card(
                  child: ListTile(
                      title: Text(
                        'Release Stocks',
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey,
                        ),
                        textAlign: TextAlign.center,
                      ))),
              Form(
                key: _formKey,
                child: Container(
                  margin: const EdgeInsets.all(24.0),
                  child: Column(
                    children: <Widget>[
                  FutureBuilder<QuerySnapshot>(
                  future: FirebaseFirestore.instance.collection('SalesPerson').get(),
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
                                    'Select Sales Person',
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
                                item["name"],
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




                              setState(() {
                                selectedValue = value as String;
                              });
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
                      FormBuilder(
                         //key: _formKey,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(top: 25, bottom: 17),
                              child: FormBuilderDateTimePicker(
                                name: 'date',
                                // onChanged: _onChanged,
                                inputType: InputType.both,
                                decoration: InputDecoration(
                                  labelText: 'Release Date and Time',
                                  labelStyle: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),

                                // initialValue: DateTime.now(),
                                // enabled: true,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(14.0),
                              child: FormBuilderTextField(
                                controller: Controller1,
                                name: 'age',
                                decoration: InputDecoration(
                                  labelText: 'Gurudeva',
                                  hintText: myController1,
                                  labelStyle: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(14.0),
                              child: FormBuilderTextField(
                                controller: Controller2,
                                name: 'age',
                                decoration: InputDecoration(
                                  hintText: myController2,
                                  labelText: 'Six O\' Mega',
                                  labelStyle: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(14.0),
                              child: FormBuilderTextField(
                                controller: Controller3,
                                name: 'age',
                                decoration: InputDecoration(
                                  hintText: myController3,
                                  labelText: 'Six O\' 50',
                                  labelStyle: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(14.0),
                              child: FormBuilderTextField(
                                controller: Controller4,
                                name: 'age',
                                decoration: InputDecoration(
                                  hintText: myController4,
                                  labelText: 'Six O\'',
                                  labelStyle: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(14.0),
                              child: FormBuilderTextField(
                                controller: Controller5,
                                name: 'age',
                                decoration: InputDecoration(
                                  hintText: myController5,
                                  labelText: 'Paramitha Red',
                                  labelStyle: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(14.0),
                              child: FormBuilderTextField(
                                controller: Controller6,
                                name: 'age',
                                decoration: InputDecoration(
                                  hintText: myController6,
                                  labelText: 'Paramitha Green',
                                  labelStyle: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(14.0),
                              child: FormBuilderTextField(
                                controller: Controller7,
                                name: 'age',
                                decoration: InputDecoration(
                                  hintText: myController7,
                                  labelText: 'Jasmine',
                                  labelStyle: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(14.0),
                              child: FormBuilderTextField(
                                controller: Controller8,
                                name: 'age',
                                decoration: InputDecoration(
                                  hintText: myController8,
                                  labelText: 'Araliya',
                                  labelStyle: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
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
                              print("updated");

                              if((documents2["Gurudeva"]-int.parse(Controller1.text))<=50){
                                _showNotification();
                              }

                              DocumentReference documentReference =
                              FirebaseFirestore.instance.collection("SalesPerson").doc(myControllerID);

                              Map<String, dynamic> products = {
                                "Gurudeva": int.parse(Controller1.text) + int.parse(myController1),
                                "SixOMega": int.parse(Controller2.text)+int.parse(myController2),
                                "SixO50": int.parse(Controller3.text)+int.parse(myController3),
                                "SixO": int.parse(Controller4.text)+int.parse(myController4),
                                "ParamithaG": int.parse(Controller5.text)+int.parse(myController5),
                                "ParamithaR": int.parse(Controller6.text)+int.parse(myController6),
                                "Jasmine": int.parse(Controller7.text)+int.parse(myController7),
                                "Araliya": int.parse(Controller8.text)+int.parse(myController8),
                              };

                              documentReference.update(products).whenComplete(() {
                                print("updated");
                              });

                              FirebaseFirestore.instance.collection('Products')
                                  .doc('1Z1Y2kvIf7bBl8EaFTm8')
                                  .set({
                                "Gurudeva": documents2["Gurudeva"]-int.parse(Controller1.text),
                                "SixOMega": documents2["SixOMega"]-int.parse(Controller2.text),
                                "SixO50": documents2["SixO50"]-int.parse(Controller3.text),
                                "SixO": documents2["SixO"]-int.parse(Controller4.text),
                                "ParamithaG": documents2["ParamithaG"]-int.parse(Controller5.text),
                                "ParamithaR": documents2["ParamithaR"]-int.parse(Controller6.text),
                                "Jasmine": documents2["Jasmine"]-int.parse(Controller7.text),
                                "Araliya": documents2["Araliya"]-int.parse(Controller8.text),
                                "UpdateTime": DateTime.now(),
                              })
                                  .then((value) => print("User Added"))
                                  .catchError((error) => print("Failed to add user: $error"));

                              Controller1.clear();
                              Controller2.clear();
                              Controller3.clear();
                              Controller4.clear();
                              Controller5.clear();
                              Controller6.clear();
                              Controller7.clear();
                              Controller8.clear();


                            },
                          ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
