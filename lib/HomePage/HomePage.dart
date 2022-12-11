import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:timetabler/registration/Signup.dart';
import 'package:timetabler/registration/Login.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData.dark(),
      home: Scaffold(
          appBar: AppBar(
            title: Text('דף ראשי'),
          ),
          body: Center(child: Column(children: <Widget>[
            Container(
              margin: EdgeInsets.all(25),
              child: FlatButton(
                child: Text('הרשמה', style: TextStyle(fontSize: 20.0),),
                onPressed: () {                Navigator.push(
                    context,
                    MaterialPageRoute(builder:( context) {
                      return Signup();
                    },
                    ));},
              ),
            ),
            Container(
              margin: EdgeInsets.all(25),
              child: FlatButton(
                child: Text('כניסה', style: TextStyle(fontSize: 20.0),),
                color: Colors.blueAccent,
                textColor: Colors.white,
                onPressed: () {                Navigator.push(
                    context,
                    MaterialPageRoute(builder:( context) {
                      return Login();
                    },
                    ));},
              ),
            ),
            Divider(
              color: Colors.black,
              thickness: 2,
            )
          ]
          ))

      ),
    );
  }
}