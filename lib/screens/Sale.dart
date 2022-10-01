import 'package:flutter/material.dart';
import 'return_sales.dart';
import 'current_sale.dart';
import 'SalesHome.dart';


class Sales extends StatefulWidget {
  const Sales({Key? key}) : super(key: key);

  @override
  _SalesState createState() => _SalesState();
}

class _SalesState extends State<Sales> {


  final payItems = ['Cash' , 'Credit Card' , 'Online Payment'];
  String? value;

  final  listItem = [
    "Shop A" , "Shop B" ,"Shop C" ,"Shop D" , "Shop E"
  ];
  String? values;


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
          leading: IconButton(
            icon: Icon(Icons.home),
            onPressed: (){
              Navigator.pop(context,SalesHome(title: 'Home Page',));
            },
          ),
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

          bottom: TabBar(

            tabs: [
              Tab(text: "Current Sales",),
              Tab(text: "Return Sales",),
            ],
          ),
          title:Text("Bobby Marketing",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 23,
                color: Colors.white,
              )),
          backgroundColor: Color(0xFF363f93),
        ),
        body: TabBarView(
          children: [
            currentsales(),
            returnsales(),
          ],
        )
      ),
    );

  }



}
