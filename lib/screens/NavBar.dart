import 'package:flutter/material.dart';


class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Drawer(
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
    );
  }
}
