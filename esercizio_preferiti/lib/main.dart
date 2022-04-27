import 'package:flutter/material.dart';
import 'package:esercizio_preferiti/models/pizza.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // creo una lista vuota dove inseriro i preferiti, cioe gli id delle pizze
  List<String> _preferiti = [];


  // funzione asincrona che la uso per inizializzare la classe SharedPreferences
  void initializeSharePreferences() async {
    // mi restituisce un istanza di sharedPreferences che chiamo ss, che è di tipo SharedPreferences
    SharedPreferences ss = await SharedPreferences.getInstance();

    // adesso che ho inzializzata posso richiamarla
    setState(()  {
      _preferiti = ss.getStringList('preferiti') ?? [];
    });

  }

  // creo una funzione che aggiorna il valore della lista _preferiti
  void addOneFavoriteToPreferiti(String id) async {
    setState(() {
      _preferiti.add(id);
    });

    // ho bisogno di inizializzare nuovamente
    SharedPreferences ss = await SharedPreferences.getInstance();
    ss.setStringList('preferiti', _preferiti);
  }

  @override
  void initState() {
    super.initState();
    // richiamo la funzione initializeSharePreferences()
    initializeSharePreferences();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pizze'),
      ),
      body: ListView.builder(
        itemCount: Pizza.listaPizze.length,
        itemBuilder: (context, index){
          return ListTile(
            title: Text(Pizza.listaPizze[index].nome),
            trailing: IconButton(
              icon: _preferiti.contains(Pizza.listaPizze[index].id) ? const Icon(Icons.favorite, color: Colors.red,) :
              const Icon(Icons.favorite_border_outlined),
              onPressed: () => addOneFavoriteToPreferiti(Pizza.listaPizze[index].id),
            ),
          );
        },
      ),
    );
  }
}