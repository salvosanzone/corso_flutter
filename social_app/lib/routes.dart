import 'package:flutter/material.dart';
import 'package:social_app/pages/check_loggated.dart';
import 'package:social_app/pages/home.dart';
import 'package:social_app/pages/login_page.dart';


generateRoutes() {
  return {
    '/': (context) => CheckLoggated(),
    '/home': (context) => Home(),
    '/login': (context) => LoginPage(),
  };
}