import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'dart:async';
import 'package:flutter/services.dart';

class LogInApp extends StatefulWidget {
  LogInApp({Key key}) : super(key: key);

  @override
  _LogInAppState createState() => _LogInAppState();
}

class _LogInAppState extends State<LogInApp> {
  Artboard _riveArtboard;
  @override
  void initState() {
    super.initState();
    rootBundle.load('assets/images/code2.riv').then(
      (data) async {
        var file = RiveFile();
        var success = file.import(data);
        if (success) {
          var artboard = file.mainArtboard;
          artboard.addController(
            SimpleAnimation('main'),
          );
          setState(() => _riveArtboard = artboard);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white24,
      child: Column(
        children: [
          Expanded(child: Container()),
          Container(
            width: 300,
            height: 300,
            child: Center(
              child: _riveArtboard == null
                  ? const SizedBox()
                  : Rive(artboard: _riveArtboard),
            ),
          ),
          Card(
            margin: EdgeInsets.only(right: 40, left: 40),
            child: Container(
              margin: EdgeInsets.all(15),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/google.png',
                    width: 30,
                  ),
                  Expanded(child: Container()),
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    child: Text(
                      "Iniciar session con google",
                      style: TextStyle(color: Colors.black87),
                    ),
                  ),
                  Expanded(child: Container()),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(5),
          ),
          Card(
            color: Color.fromRGBO(59, 89, 152, 1),
            margin: EdgeInsets.only(right: 40, left: 40),
            child: Container(
              margin: EdgeInsets.all(15),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/facebookb.png',
                    width: 30,
                  ),
                  Expanded(child: Container()),
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    child: Text(
                      "Iniciar session con facebook",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Expanded(child: Container()),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(5),
          ),
          Card(
            color: Colors.red,
            margin: EdgeInsets.only(right: 40, left: 40),
            child: Container(
              margin: EdgeInsets.all(15),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/correo2.png',
                    width: 30,
                  ),
                  Expanded(child: Container()),
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    child: Text(
                      "Iniciar session con Correo",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Expanded(child: Container()),
                ],
              ),
            ),
          ),Container(
            margin: EdgeInsets.all(5),
          ),
          Card(
            color: Color.fromRGBO(15, 172, 21, 1),
            margin: EdgeInsets.only(right: 40, left: 40),
            child: Container(
              margin: EdgeInsets.all(15),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/noacount.png',
                    width: 30,
                  ),
                  Expanded(child: Container()),
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    child: Text(
                      "Continuar sin cuenta",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Expanded(child: Container()),
                ],
              ),
            ),
          ),
          Expanded(child: Container()),
        ],
      ),
    );
  }
}
