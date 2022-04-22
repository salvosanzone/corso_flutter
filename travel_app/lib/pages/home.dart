import 'package:flutter/material.dart';
import 'package:travel_app/components/card_place.dart';
import 'package:travel_app/components/category_card.dart';
import 'package:travel_app/components/custom_drawer.dart';
import 'package:travel_app/components/title_custom.dart';
import 'package:travel_app/models/interessi.dart';
import 'package:travel_app/models/meta_turistica.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.grey),
        elevation: 0,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.pin_drop_sharp, color: Colors.indigo),
            Text('Italia', style: TextStyle(color: Colors.indigo),),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/avatar1.jpg'),
            ),
          ),
        ],
      ),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                      'Category', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                ),
                SizedBox(
                  height: 90,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: Interessi.values.map(
                        (interesse) => CategoryCard(
                            icona: interesse.icon,
                            text: interesse.name,
                            colore: interesse.colore,
                        ),
                    ).toList(),
                  ),
                ),
              ],
            ),
            Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey.shade200)
                          ),
                          labelText: 'Search',
                          iconColor: Colors.black,
                          hintText: 'Search',
                          suffixIcon: const Icon(Icons.search),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.blue.shade100,
                    ),
                    margin: const EdgeInsets.only(left: 8),
                    padding: const EdgeInsets.all(16),
                    child: const Icon(Icons.filter_list_outlined, color: Colors.indigo,),
                  ),
                ],
              ),
            const TitleCustom(text: 'Popular Place'),
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: MetaTuristica.listaMete.length,
                itemBuilder: (context, index) {
                  if(MetaTuristica.listaMete[index].rating >= 5) {
                    return CardPlace(
                         MetaTuristica.listaMete[index],
                    );
                  }
                  return const SizedBox(width: 0);
                }
              ),
            ),
            const TitleCustom(text: 'Reccomended'),
            SizedBox(
              height: 150,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: MetaTuristica.listaMete.length,
                  itemBuilder: (context, index) {
                    if(MetaTuristica.listaMete[index].raccomanded) {
                      return CardPlace(
                           MetaTuristica.listaMete[index],
                      );
                    }
                    return const SizedBox(width: 0);
                  }
              ),
            ),

          ],
        ),
      ),
    );
  }
}
