
import 'package:flutter/material.dart';
import 'package:travel_app/pages/home.dart';
import 'package:travel_app/pages/loggated_or_not.dart';
import 'package:travel_app/pages/login_page.dart';
import 'package:travel_app/pages/search_page.dart';

generateRoutes() {
  return {
    '/' : (context) => LoggatedOrNot(),
    '/home' : (context) => const Home(),
    '/profile' : (context) => const Center(child: Text('Profilo')),
    '/details': (context) => const Center(child: Text('Details')),
    '/favorites' : (context) => const Center(child: Text('Preferiti')),
    '/search' : (context) => SearchPage(),
    '/login' : (context) => LoginPage(),
  };
}