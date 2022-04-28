import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_app/models/meta_turistica.dart';


class AddFavoriteButton extends StatefulWidget {
  final MetaTuristica metaTuristica;

  const AddFavoriteButton({Key? key, required this.metaTuristica}) : super(key: key);

  @override
  _AddFavoriteButtonState createState() => _AddFavoriteButtonState();
}

class _AddFavoriteButtonState extends State<AddFavoriteButton> {

  // creo una variabile di stato
  bool favoriteCity = false;


  void inizializeSharedPreferences() async {
    SharedPreferences ss = await SharedPreferences.getInstance();

    // creo una variabile che contenga la lista di tutte le mete preferite
    final favoriteCities = ss.getStringList('favorite') ?? [];

    // inizializzo una variabile di stato quindi ho bisogno di usare setState()
      setState(() {
        favoriteCity = favoriteCities.contains(widget.metaTuristica.city);
      });

  }

  Future<void> addOrRemoveFavorite() async {
    SharedPreferences ss = await SharedPreferences.getInstance();

    // creo una nuova variabile non final poiche puo potersi cambiare successivamente
    // essa conterra la lista di mete attuali
    var lastFavoriteCities = ss.getStringList('favorite') ?? [];

      favoriteCity ? lastFavoriteCities.remove(widget.metaTuristica.city) : lastFavoriteCities.add(widget.metaTuristica.city);
      await ss.setStringList('favorite', lastFavoriteCities);
    }

  @override
  void initState() {
    super.initState();
    inizializeSharedPreferences();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 4,
            offset: Offset(6, 8), // Shadow position
          ),
        ],
        borderRadius: BorderRadiusDirectional.circular(8),
        color: Colors.grey.shade200,
      ),
      width: 50,
      height: 50,
      child: IconButton(
        onPressed: () async {
          await addOrRemoveFavorite();
          setState(() {
            favoriteCity = !favoriteCity;
          });
        },
        icon: favoriteCity ? const Icon(Icons.bookmark) : const Icon(Icons.bookmark_border)
      ),
    );
  }
}

