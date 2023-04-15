import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/page/home_page.dart';
import 'package:flutter_application_1/page/register_page.dart';

class LoginPage extends StatelessWidget {
  final username = TextEditingController();
  final password = TextEditingController();
  // final TextEditingController usernamecont = TextEditingController();
  // final TextEditingController passwordcont = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map?;

    if (args != null) {
      print(args['username']);
      print(args['password']);
    }

    return Scaffold(
        body: Container(
      color: ColorPalette.primaryColor,
      padding: EdgeInsets.all(20.0),
      child: ListView(
        children: <Widget>[
          Center(
            child: Column(
              children: <Widget>[
                _iconLogin(),
                _titleDescription(),
                _textField(),
                _buildButton(context, args),
              ],
            ),
          ),
        ],
      ),
    ));
  }

  Widget _iconLogin() {
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
          "Halo Selamat Datang!",
          style: TextStyle(
              color: Colors.black, fontSize: 23.0, fontFamily: 'PoppinsBold'),
        ),
        Padding(
          padding: EdgeInsets.only(top: 12.0),
        ),
        Text(
          "BMI Checker merupakan apikasi untuk membantu kamu menghitung berat idealmu",
          style: TextStyle(
              fontSize: 16.0,
              color: Colors.black,
              fontFamily: 'PoppinsRegular'),
          textAlign: TextAlign.center,
        ),
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
      ],
    );
  }

  Widget _buildButton(BuildContext context, Map? args) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 16.0),
        ),
        InkWell(
          onTap: () {
            if (args != null) {
              print(args['username']);
              print(args['password']);
              if (username.text == args['username'] &&
                  password.text == args['password']) {
                // print("BERHASIL");
                Navigator.pushNamed(context, '/homepage', arguments: {
                  "username": username.text,
                  "password": password.text,
                });

              }
              else (
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Error'),
                  content: Text('Username atau password salah'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('OK'),
                    ),
                  ],
                ),
              )
            );
            }
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 18.0),
            width: double.infinity,
            child: Text(
              'Login',
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
          padding: EdgeInsets.only(top: 18.0),
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
            'Register',
            style: TextStyle(color: Colors.blue, fontFamily: 'PoppinsRegular'),
          ),
          onPressed: () {
            Navigator.pushNamed(context, RegisterPage.routeName);
          },
        ),
      ],
    );
  }
}
