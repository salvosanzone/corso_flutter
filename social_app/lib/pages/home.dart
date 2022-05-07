import 'package:flutter/material.dart';
import 'package:social_app/components/add_post_button.dart';
import 'package:social_app/components/container_post.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_app/pages/profile_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';



class Home extends StatefulWidget {
  final bool active;
  final String? userId;
  const Home({this.active = true, this.userId, Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _currentIndex = 0;


  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              if(widget.active)
              Stack(
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade400,
                          blurRadius: 4,
                          offset: const Offset(0, 8), // Shadow position
                        ),
                      ],
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(80),
                        topRight: Radius.circular(80),
                      ),
                      image: const DecorationImage(
                          image: NetworkImage('https://www.wallpapertip.com/wmimgs/79-791851_sightings-free-orange-background-hd.png'),
                          fit: BoxFit.cover
                      ),
                    ),
                  ),
                  Positioned(
                      top: 10,
                      left: 10,
                      child: GestureDetector(
                        onTap: () => Navigator.of(context).pushNamed('/login'),
                        child: const Text(
                          'SanzApp', style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                      )
                  ),
                  Positioned(
                      bottom: 10,
                      right: 10,
                      child: IconButton(

                        // al click salvo passso alla pagina del profilo, l'id salvato in SP con la chiave di idKey
                        onPressed: () async {
                          SharedPreferences ss = await SharedPreferences.getInstance();
                          var _idProfileClicked = ss.getString('idKey');

                          Navigator.push(
                            context, MaterialPageRoute(
                            builder: (context) => ProfilePage(giveMeId: _idProfileClicked!),
                          ),
                          );

                        },
                        icon: const Icon(Icons.person, color: Colors.white,),
                      )
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              Expanded(
                child: ContainerPost(userId: widget.userId,),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: AddPostButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,


      bottomNavigationBar: BottomNavigationBar(
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
              },
              icon: Icon(Icons.home,),
            )
          ),
          BottomNavigationBarItem(
              backgroundColor: Colors.white,
              label: 'PROFILE',
            icon: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                Navigator.push(
                  context, MaterialPageRoute(
                  builder: (context) {
                    return ProfilePage(giveMeId: "60d0fe4f5311236168a109ca");
                  }
                ),
                );
              },
              icon: Icon(Icons.person,),
            )
          ),
        ],
      ),
      /*bottomNavigationBar: CurvedNavigationBar(
          key: navigationKey,
          backgroundColor: Colors.transparent,
          height: 60,
          color: Colors.orange.shade500,
          items: [
            IconButton(
              icon: const Icon(Icons.add_circle, color: Colors.white,),
              onPressed: () {
                final navigationState = navigationKey.currentState!;
                navigationState.setPage(0);
              },
            ),
            const Icon(Icons.add_circle, color: Colors.white,),
            const Icon(Icons.home, color: Colors.white,),
            //const Icon(Icons.person, color: Colors.white,),
          ],
        ),
      */


    );
  }
}



