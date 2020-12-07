import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
class LoginIn with ChangeNotifier, DiagnosticableTreeMixin {
  String _loggedIn = "false";
  String isLoggedIn()=>_loggedIn;
  void login(){
    _loggedIn = "true";
    notifyListeners();
  }
  void logout(){
    _loggedIn = "false";
    notifyListeners();
  }
  String get loggedIn => _loggedIn;
  //context.read<LoginIn>().src.login();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('loggedIn', loggedIn));
  }

}
