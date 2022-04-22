import 'package:flutter/material.dart';
import 'package:travel_app/models/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
        ),
      ),
      initialRoute: '/',
      routes: generateRoutes(),
    );
  }
}

