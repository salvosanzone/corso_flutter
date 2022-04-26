import 'package:flutter/material.dart';
import 'package:travel_app/models/meta_turistica.dart';

class FilterDrawer extends StatefulWidget {
  // valori ATTUALI dei filtri
  final RangeValues selectedRating;
  final String? selectedCountry;

  // funzione callback, ricerca i valori attuali quando clicco su Applica
  final Function({int minRating, int maxRating, String? country}) setFilters;

  const FilterDrawer(
      {required this.selectedRating,
      required this.setFilters,
      this.selectedCountry,
      Key? key})
      : super(key: key);

  @override
  _FilterDrawerState createState() => _FilterDrawerState();
}

class _FilterDrawerState extends State<FilterDrawer> {
  // qui invece inserisco le variabili di STATO e contengono i valori dei filtri che ho applicato
  late RangeValues _selectedRating;
  String? _selectedCountry;

  // list degli stati
  late List<String> _countryList;

  @override
  // situazione iniziale del widget, valori di default
  void initState() {
    super.initState();
    _selectedRating = widget.selectedRating;
    _countryList =
        MetaTuristica.listaMete.map((meta) => meta.country).toSet().toList();

    // ordino la lista in ordine alfabetico
    _countryList.sort();
  }

  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          bottomLeft: Radius.circular(16),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text('Filtri'),
              Expanded(
                child: Form(
                  child: ListView(
                    children: [
                      Row(
                        children: [
                          const Text('1'),
                          Expanded(
                            child: RangeSlider(
                              values: _selectedRating,
                              onChanged: (RangeValues value) {
                                setState(() {
                                  _selectedRating = value;
                                });
                              },
                              min: 1,
                              max: 5,
                              labels: RangeLabels(
                                  _selectedRating.start
                                      .toString()
                                      .substring(0, 1),
                                  _selectedRating.end
                                      .toString()
                                      .substring(0, 1)),
                            ),
                          ),
                          const Text('5'),
                        ],
                      ),
                      const SizedBox(height: 20),
                      FormField(
                        builder: (context) {
                          return InputDecorator(
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Country'),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String?>(
                                  isDense: true,
                                  value: _selectedCountry,
                                  items: <DropdownMenuItem<String?>>[
                                        const DropdownMenuItem(
                                          child:
                                              Text('Nessuno stato selezionato'),
                                          value: null,
                                        )
                                      ] +
                                      _countryList
                                          .map((country) =>
                                              DropdownMenuItem<String?>(
                                                child: Text(country),
                                                value: country,
                                              ))
                                          .toList(),
                                  onChanged: (metaSelezionata) {
                                    setState(() {
                                      _selectedCountry = metaSelezionata;
                                    });
                                  }),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text('Reset'),
                  ),
                  TextButton(
                    onPressed: () {
                      widget.setFilters(
                        minRating: _selectedRating.start.toInt(),
                        maxRating: _selectedRating.end.toInt(),
                      );
                    },
                    child: Text('Applica'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
