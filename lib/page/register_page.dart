import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';

class RegisterPage extends StatelessWidget {
  final username = TextEditingController();
  final password = TextEditingController();

  static const routeName = "/register";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ColorPalette.primaryColor,
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  _iconRegister(),
                  _titleDescription(),
                  _textField(),
                  _buildButton(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _iconRegister() {
    return Image.asset(
      "assets/images/bmi.png",
      width: 150.0,
      height: 150.0,
    );
  }

  Widget _titleDescription() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 16.0),
        ),
        Text(
          "Buat Akunmu",
          style: TextStyle(
            color: Colors.black,
            fontSize: 23.0,
            fontFamily: 'PoppinsBold',
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 12.0),
        ),
        // Text(
        //   "",
        //   style: TextStyle(
        //     fontSize: 12.0,
        //     color: Colors.black,
        //   ),
        //   textAlign: TextAlign.center,
        // ),
      ],
    );
  }

  Widget _textField() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 12.0),
        ),
        TextFormField(
          controller: username,
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: ColorPalette.underlineTextField,
                width: 1.5,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
                width: 3.0,
              ),
            ),
            hintText: "username",
            hintStyle: TextStyle(
                color: ColorPalette.hintColor, fontFamily: 'PoppinsRegular'),
          ),
          style: TextStyle(color: Colors.black),
          autofocus: false,
        ),
        Padding(
          padding: EdgeInsets.only(top: 12.0),
        ),
        TextFormField(
          controller: password,
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: ColorPalette.underlineTextField,
                width: 1.5,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
                width: 3.0,
              ),
            ),
            hintText: "Password",
            hintStyle: TextStyle(
                color: ColorPalette.hintColor, fontFamily: 'PoppinsRegular'),
          ),
          style: TextStyle(color: Colors.black),
          obscureText: true,
          autofocus: false,
        ),
        Padding(
          padding: EdgeInsets.only(top: 12.0),
        ),
        TextFormField(
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: ColorPalette.underlineTextField,
                width: 1.5,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
                width: 3.0,
              ),
            ),
            hintText: "Confirm Password",
            hintStyle: TextStyle(
                color: ColorPalette.hintColor, fontFamily: 'PoppinsRegular'),
          ),
          style: TextStyle(color: Colors.black),
          obscureText: true,
          autofocus: false,
        ),
      ],
    );
  }

  Widget _buildButton(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 16.0),
        ),
        InkWell(
          onTap: () {
            Navigator.pushReplacementNamed(
              context,
              '/',
              arguments: {
                "username": username.text,
                "password": password.text,
              },
            );
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 18.0),
            width: double.infinity,
            child: Text(
              'Register',
              style: TextStyle(
                  color: ColorPalette.primaryColor,
                  fontFamily: 'PoppinsRegular'),
              textAlign: TextAlign.center,
            ),
            decoration: BoxDecoration(
              color: ColorPalette.underlineTextField,
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 16.0),
        ),
        Text(
          'or',
          style: TextStyle(
            color: Colors.black,
            fontSize: 12.0,
            fontFamily: 'PoppinsRegular',
          ),
        ),
        TextButton(
          child: Text(
            'Login',
            style: TextStyle(color: Colors.blue, fontFamily: 'PoppinsRegular'),
          ),
          onPressed: () {
            Navigator.pushNamed(context, "/");
          },
        ),
      ],
    );
  }
}
