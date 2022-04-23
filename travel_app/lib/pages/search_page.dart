import 'package:flutter/material.dart';
import 'package:travel_app/components/custom_search_bar.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.blue.shade100,
            ),
            margin: const EdgeInsets.fromLTRB(0, 6, 16, 0),
            child: const Padding(
              padding: EdgeInsets.fromLTRB(8, 2, 8, 2),
              child: Icon(Icons.filter_list_outlined, color: Colors.indigo,),
            ),
          ),
        ],
        leading:  IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.chevron_left, color: Colors.black)
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const [
            CustomSearchBar(),
          ],
        ),
      ),
    );
  }
}
