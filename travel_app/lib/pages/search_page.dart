import 'package:flutter/material.dart';
import 'package:travel_app/components/custom_search_bar.dart';
import 'package:travel_app/components/card_filter.dart';
import 'package:travel_app/components/filter_drawer.dart';
import 'package:travel_app/models/meta_turistica.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  // filtro della citta nella barra di ricerca
  late List<MetaTuristica> _risultatiRicerca;

  late final GlobalKey<ScaffoldState> _scaffoldKey;

  // queste varibili contengono i filtri applicati
  String? _parolaDiRicerca;
  late int _minRating;
  late int _maxRating;
  String? _country;
  bool? _available;
  @override

  // qui inizializzo le variabili, saranno i valori di default
  void initState() {
    super.initState();
    _minRating = 1;
    _maxRating = 5;
    _risultatiRicerca = MetaTuristica.listaMete;
    _scaffoldKey = GlobalKey();
  }

  // creo una funzione, essa mette in relazione questa pagina con il Drawer tramite un altra funzione chiamata setFilters
  void _setAdditionalFilters({
    int minRating = 1,
    int maxRating = 5,
    String? country,
    bool? available
  })
   {
     _minRating = minRating;
     _maxRating = maxRating;
     _country = country;
     _available = available;

     // richiamo la funzione _filtraMete
     _filtraMete(_parolaDiRicerca ?? '');
   }

   // creo la funzione _additionaFiltersFor() che mi restituisce un true o false
  bool _additionaFiltersFor(MetaTuristica meta) {
    return meta.rating >= _minRating
        && meta.rating <= _maxRating
        && (_country == null || meta.country == _country)
        && (_available == null || _available == false || meta.available == _available);
  }


   // creo la funzione _filtraMete()
  void _filtraMete(String parolaDiRicerca){
    _parolaDiRicerca = parolaDiRicerca;
    if(parolaDiRicerca.isEmpty){
      setState(() {
        // richiamo la funzione _additionaFiltersFor()
        _risultatiRicerca = MetaTuristica.listaMete.where((meta) => _additionaFiltersFor(meta)).toList();
      });
    } else {
      setState(() {
        _risultatiRicerca = MetaTuristica.listaMete.where(
                (meta) {
              return meta.city.toLowerCase().contains(parolaDiRicerca.toLowerCase())
                  && _additionaFiltersFor(meta);
            })
            .toList();
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        actions: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.blue.shade100,
            ),
            margin: const EdgeInsets.fromLTRB(0, 6, 16, 0),
            child: IconButton(
              onPressed: () => _scaffoldKey.currentState?.openEndDrawer(),
              icon: const Icon(Icons.filter_list_outlined, color: Colors.indigo),
            ),
          ),
        ],
        leading:  IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.chevron_left, color: Colors.black54, size: 32)
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomSearchBar(shouldGoToSearchPage: false, callback: _filtraMete),
            _risultatiRicerca.length == 0
            ? Text('Nessun risultato per la ricerca')
            : Expanded(
                child: ListView.builder(
                  itemCount: _risultatiRicerca.length,
                    itemBuilder: (context, index){
                      return SizedBox(
                          height: 100,
                          child: CardFilter(_risultatiRicerca[index]));
                    }
                ),)
          ],
        ),
      ),
      endDrawer: FilterDrawer(

        // attributi che passo a FilterDrawer, varibili piu una funzione
        selectedRating: RangeValues(_minRating.toDouble(), _maxRating.toDouble()),
        setFilters: _setAdditionalFilters,
        selectedCountry: _country,
        available: _available,

      ),
    );
  }
}

