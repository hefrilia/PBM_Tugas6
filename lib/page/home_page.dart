import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'bmi_result.dart';

class HomePage extends StatefulWidget {
  // const HomePage({super.key});

  // final String username;
  // final String password;

// HomePage({Key key, required this.username}):super(key: key)
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map?;
    return Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: InputBMI(
          args: args,
        ));
  }
}

class InputBMI extends StatelessWidget {
  TextEditingController tinggi = TextEditingController();
  TextEditingController berat = TextEditingController();
  InputBMI({super.key, this.args});
  final args;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blue[50],
      // appBar: AppBar(
      //   //backgroundColor: Colors.blue[900],
      //   centerTitle: true,
      //   // leading: Icon(
      //   //   Icons.favorite,
      //   //   color: Colors.pink,
      //   // ),
      //   // title: Text('MENGHITUNG BMI'),
      // ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text((args != null)
                ? args['username']
                : "", style: TextStyle(fontSize: 22, fontFamily: 'PoppinsMedium' ),),
                 // (args != null) ? args['username'] : ""
            Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.all(10),
                // color: Colors.blue[700],
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: tinggi,
                        keyboardType: TextInputType.number,
                        maxLength: 3,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'PoppinsRegular'
                        ),
                        decoration: InputDecoration(
                            suffix: Text('cm'),
                            filled: true,
                            hintText: 'Tinggi'),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextField(
                        controller: berat,
                        keyboardType: TextInputType.number,
                        maxLength: 3,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'PoppinsRegular'
                        ),
                        decoration: InputDecoration(
                            suffix: Text('kg'),
                            filled: true,
                            hintText: 'Berat'),
                      ),
                    ),
                  ],
                )),
            Container(
              //height: double.infinity,
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BMIResult(
                            tinggi_badan: int.parse(tinggi.text),
                            berat_badan: int.parse(berat.text))),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  backgroundColor: Colors.blue,
                  textStyle: TextStyle(color: Colors.white),
                ),
                child: Text(
                  'HITUNG BMI',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500, fontFamily:'PoppinsMedium'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
