import 'package:flutter/material.dart';
import 'package:trening_app/view/login.dart';

const String logIn = "login";

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case logIn:
      return MaterialPageRoute(builder: (context) => const LogIn());
    default:
      throw ('This route name does not exist');
  }
}