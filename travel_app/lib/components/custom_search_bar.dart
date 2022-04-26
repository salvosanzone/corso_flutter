import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final bool show;
  final bool shouldGoToSearchPage;
  final Function(String)? callback;
  const CustomSearchBar({this.shouldGoToSearchPage = false, this.callback, this.show = false, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: TextField(
              onTap: shouldGoToSearchPage
                  ? () {
                Navigator.of(context).pushNamed('/search');
                FocusScope.of(context).unfocus();
              }
              : null ,
              onChanged: callback,
              readOnly: shouldGoToSearchPage,
              autofocus: !shouldGoToSearchPage,
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

        show ? Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.blue.shade100,
          ),
          margin: const EdgeInsets.only(left: 8),
          padding: const EdgeInsets.all(16),
          child: const Icon(Icons.filter_list_outlined, color: Colors.indigo,),
        ) : const Text('')


      ],
    );
  }
}
