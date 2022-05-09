import 'package:flutter/material.dart';
import 'package:social_app/pages/home.dart';
import 'package:social_app/pages/profile_page.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.white,
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      backgroundColor: Colors.orange,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
            backgroundColor: Colors.white,
            label: 'HOME',
            icon: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return const Home();
                  }),
                );
              },
              icon: const Icon(
                Icons.home,
              ),
            )),
        BottomNavigationBarItem(
            backgroundColor: Colors.white,
            label: 'PROFILE',
            icon: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return const ProfilePage(
                        giveMeId: "60d0fe4f5311236168a109ca");
                  }),
                );
              },
              icon: const Icon(
                Icons.person,
              ),
            )),
      ],
    );
  }
}
