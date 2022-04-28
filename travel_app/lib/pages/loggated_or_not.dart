import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_app/pages/home.dart';
import 'package:travel_app/pages/login_page.dart';


class LoggatedOrNot extends StatefulWidget {
  const LoggatedOrNot({Key? key}) : super(key: key);

  @override
  _LoggatedOrNotState createState() => _LoggatedOrNotState();
}

class _LoggatedOrNotState extends State<LoggatedOrNot> {

  // creo una variabile di stato
  bool loggedIn = false;

  // creo un istanza di SharedPreferences
  void inizializeSharedPreferences() async {
    SharedPreferences ss  = await SharedPreferences.getInstance();

    // inserisco il get quindi creo un legame tra la chiave e loggedIn
    setState(() {
      loggedIn = ss.getBool('logKey') ?? false;
    });
  }


  // richiamo la funzione
  @override
  void initState() {
    super.initState();
    inizializeSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return loggedIn ? const Home() : LoginPage();
  }
}
