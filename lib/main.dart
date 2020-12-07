import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';
import 'dart:async';
import 'State/login_state.dart';
import 'src/login/loginapp.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginIn()),
      ],
      child: MaterialApp(
          theme: ThemeData(primaryColor: Colors.green),
          localizationsDelegates: [],
          supportedLocales: [
            const Locale('es', 'CO'), // Colombia
            const Locale('en', 'US'), // English
          ],
          debugShowCheckedModeBanner: false,
          home: SplashScreen()),
    ),
  );
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Artboard _riveArtboard;
  @override
  void initState() {
    initlogin();
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

  initlogin() {
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LogInApp())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.black54),
          ),
          Container(
            child: Center(
              child: _riveArtboard == null
                  ? const SizedBox()
                  : Rive(artboard: _riveArtboard),
            ),
          ),
        ],
      ),
    );
  }
}
