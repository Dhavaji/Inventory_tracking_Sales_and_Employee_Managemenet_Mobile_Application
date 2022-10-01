import 'package:flutter/material.dart';
import 'package:flutter_login_signup/helperSt.dart';
import 'package:flutter_login_signup/widget/textLogin.dart';
import 'package:flutter_login_signup/widget/verticalText.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_login_signup/screens/home.dart';

import '../helper.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  ServiceSt service = ServiceSt();
  Widget _logo() {
    return Image.asset(
      'assets/logo.png',
      height: 120,
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'Store Manager',
        style: GoogleFonts.rajdhani(
          textStyle: Theme.of(context).textTheme.headline1,
          fontSize: 35,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _button() {
    return Padding(
      padding: const EdgeInsets.only(top: 40, right: 50, left: 200),
      child: Container(
        alignment: Alignment.bottomRight,
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0xFF64B5F6),
              blurRadius: 10.0, // has the effect of softening the shadow
              spreadRadius: 1.0, // has the effect of extending the shadow
              offset: Offset(
                5.0, // horizontal, move right 10
                5.0, // vertical, move down 10
              ),
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: FlatButton(
          onPressed: () {

            if(emailController.text.isNotEmpty && passwordController.text.isNotEmpty){

              service.loginUser(emailController.text, passwordController.text, context);
            }
            else{
              service.error(context,"Field must not be empty");

            }

          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Login',
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Icon(
                Icons.arrow_forward,
                color: Colors.lightBlueAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _email() {
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 50, right: 50),
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: TextField(
          controller:emailController,
          style: TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            fillColor: Colors.lightBlueAccent,
            labelText: 'User Name',
            labelStyle:
            GoogleFonts.raleway(fontSize: 23, color: Colors.white70),
          ),
        ),
      ),
    );
  }

  Widget _password() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: TextField(
          controller:passwordController,
          style: TextStyle(
            color: Colors.white,
          ),
          obscureText: true,
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: 'Password',
            labelStyle:
            GoogleFonts.raleway(fontSize: 23, color: Colors.white70),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.blueGrey, Colors.lightBlueAccent]),
        ),
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(children: <Widget>[
                  VerticalText(),
                  TextLogin(),
                ]),
                SizedBox(
                  height: 20,
                ),
                _title(),
                SizedBox(
                  height: 20,
                ),
                _email(),
                _password(),
                SizedBox(
                  height: 10,
                ),
                _button(),
                SizedBox(
                  height: 40,
                ),
                _logo(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
