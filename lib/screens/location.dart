import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as loc;
import 'package:permission_handler/permission_handler.dart';

import 'mymap.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(home: locationWidget()));
}

class locationWidget extends StatefulWidget {

  @override
  _locationWidgetState createState() => _locationWidgetState();
}

class _locationWidgetState extends State<locationWidget> {
  final loc.Location location = loc.Location();
  StreamSubscription<loc.LocationData>? _locationSubscription;
  var _lights = false;
  var _livloc = false;
  //var _stoploc = false;
  String myController1 = "";

  final auth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    _requestPermission();
    location.changeSettings(interval: 300, accuracy: loc.LocationAccuracy.high);
    location.enableBackgroundMode(enable: true);
  }

  @override
  Widget build(BuildContext context) {

    bool isSwitched = false;

    void amal(){}

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
      body: FutureBuilder<QuerySnapshot>(
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
                  myController1 = item["name"];
                }
              }
          return Column(
            children: [
              Card(
                  child: ListTile(
                      title: Text(
                        'Location Settings',
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey,
                        ),
                        textAlign: TextAlign.center,
                      )
                  )),
            //   ),
              SwitchListTile(
                value: _lights,
                onChanged: (bool value) {
                  print(value);
                  setState(() {
                    _lights = value;
                  });
                },
                secondary: TextButton(
                    onPressed: () {
                      _getLocation();
                    },
                    child: Text('Add My Location',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                      textAlign: TextAlign.center,)),
              ),
              SwitchListTile(
                value: _livloc,
                onChanged: (bool value) {
                  setState(() {
                    _livloc = value;
                  });
                },
                secondary: TextButton(
                    onPressed: () {
                      _listenLocation();
                    },
                    child: Text('Enable Live Location',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                      textAlign: TextAlign.center,)),
              ),
              // SwitchListTile(
              //   value: _stoploc,
              //   onChanged: (bool value) {
              //     setState(() {
              //       _stoploc = value;
              //     });
              //   },
              //   secondary: TextButton(
              //       onPressed: () {
              //         _stopListening();
              //       },
              //       child: Text('Stop Live Location',
              //         style: TextStyle(
              //           fontSize: 20.0,
              //           fontWeight: FontWeight.bold,
              //           color: Colors.blue,
              //         ),
              //         textAlign: TextAlign.center,)),
              // ),
              // Switch(
              //     value: isSwitched,
              //     onChanged: (value) {
              //       setState(() {
              //         isSwitched = value;
              //       });
              //     }),
              Expanded(
                  child: StreamBuilder(
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
                  )),
            ],
          );
        }
            return const Text("loading");}),
    );
  }

  _getLocation() async {
    try {
      final loc.LocationData _locationResult = await location.getLocation();
      await FirebaseFirestore.instance.collection('location').doc(auth.currentUser?.uid).set({
        'latitude': _locationResult.latitude,
        'longitude': _locationResult.longitude,
        'name': myController1,
      }, SetOptions(merge: true));
    } catch (e) {
      print(e);
    }
  }

  Future<void> _listenLocation() async {
    _locationSubscription = location.onLocationChanged.handleError((onError) {
      print(onError);
      _locationSubscription?.cancel();
      setState(() {
        _locationSubscription = null;
      });
    }).listen((loc.LocationData currentlocation) async {
      await FirebaseFirestore.instance.collection('location').doc(auth.currentUser?.uid).set({
        'latitude': currentlocation.latitude,
        'longitude': currentlocation.longitude,
        'name': myController1,
      }, SetOptions(merge: true));
    });
  }

  _stopListening() {
    _locationSubscription?.cancel();
    setState(() {
      _locationSubscription = null;
    });
  }

  _requestPermission() async {
    var status = await Permission.location.request();
    if (status.isGranted) {
      print('done');
    } else if (status.isDenied) {
      _requestPermission();
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }
  }
}