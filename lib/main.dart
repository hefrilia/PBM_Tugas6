import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/home_page.dart';
import 'package:flutter_application_1/page/login_page.dart';
import 'package:flutter_application_1/page/register_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Login Register Page",
    initialRoute: "/",
    routes: {
      "/": (context) => LoginPage(),
      "/homepage": (context) => HomePage(),
      RegisterPage.routeName: (context) => RegisterPage(),
    },
    theme: ThemeData(
      fontFamily: 'Poppins',
    ),
    // home: InputBMI(),
    // home: InputBMI(),
  ));
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       routes: {
//         "/register": (context) => RegisterPage(),
//         "/login": (context) => LoginPage(),
//       },
//       initialRoute: "/register",
//     );
//   }
// }
