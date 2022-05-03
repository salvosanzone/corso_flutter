import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_app/pages/home.dart';
import 'package:social_app/pages/login_page.dart';


class CheckLoggated extends StatefulWidget {
  const CheckLoggated({Key? key}) : super(key: key);

  @override
  _CheckLoggatedState createState() => _CheckLoggatedState();
}

class _CheckLoggatedState extends State<CheckLoggated> {

  // creo una variabile che conterrà la stringa dell id o meno
  String? _id;


  // creo un istanza di SharedPreferences, dove vado a salvare i dati
  void inizializeSharedPreferences() async {
    SharedPreferences ss  = await SharedPreferences.getInstance();

    // uso il metodo get, creo legame variabile - key dove salverò il dato
    setState(() {
      _id = ss.getString('idKey');
    });

  }

  @override
  void initState() {
    super.initState();
    inizializeSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {

    // se l id non c'è allora ritorna alla login page altrimenti va alla home
    return _id == null? LoginPage() : Home();
  }
}
