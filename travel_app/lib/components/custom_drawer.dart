import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.network(
              'https://mobile-marketing.it/wp-content/uploads/2021/10/ALLERTA-FRODE-1-1-640x360.png',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 36),
          const ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
          ),const ListTile(
            leading: Icon(Icons.person),
            title: Text('Account'),
          ),const ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Favorite'),
          ),const ListTile(
            leading: Icon(Icons.travel_explore),
            title: Text('Global Search'),
          ),
          const SizedBox(height: 82),
          Column(
            children: const [
              CircleAvatar(
                radius: 36,
                backgroundImage: AssetImage('assets/avatar1.jpg'),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'SS', style: TextStyle(fontSize: 24, color: Colors.indigo),
                ),
              ),
            ],
          ),
        ],
      ),

    );
  }
}
