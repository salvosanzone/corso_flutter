import 'package:flutter/material.dart';
import 'package:social_app/api/api_post.dart';
import 'package:social_app/components/container_post.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_app/models/user.dart';
import 'package:social_app/pages/profile_page.dart';
import 'package:social_app/models/post.dart';
import 'package:social_app/models/user.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';



class Home extends StatefulWidget {
  final bool active;
  final String? userId;
  final Function? callBackFunction;
  const Home({this.callBackFunction, this.active = true, this.userId, Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  // creo una variabile che conterrà l'id
  late Post _post;
  late String _text;
  late String _tag;
  late TextEditingController _textEditingControllerText;
  late TextEditingController _textEditingControllerTag;
  int _currentIndex = 0;




  @override
  void initState() {
    _textEditingControllerText = TextEditingController();
    _textEditingControllerTag = TextEditingController();

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
      floatingActionButton: FloatingActionButton(
        elevation: 20,
        child: const Icon(Icons.add, color: Colors.white,),
        onPressed: () async {
          var popResult = await showModalBottomSheet(
            context: context,
              isScrollControlled : true,
              builder: (context) {
              return Padding(
                padding: EdgeInsets.only(
                    top: 16, left: 16, right: 16, bottom: MediaQuery.of(context).viewInsets.bottom
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: _textEditingControllerText,
                      onChanged: (value) {
                        _text = _textEditingControllerText.text;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Scrivi un testo al post',
                        icon: Icon(Icons.create)
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black54,
                                blurRadius: 16,
                                offset: Offset(4, 4), // Shadow position
                              ),
                            ],
                            image: const DecorationImage(
                              opacity: 0.9,
                              image: NetworkImage('http://www.blackelk.it/wp-content/uploads/2017/07/animali-selvatici-nelle-citt%C3%A0-BIG.jpg'),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                    ),
                    TextField(
                      controller: _textEditingControllerTag,
                      onChanged: (value) {
                        _tag = _textEditingControllerTag.text;
                      },
                      decoration: const InputDecoration(
                          hintText: 'Aggiungi dei hastag',
                          icon: Icon(Icons.tag)
                      ),
                    ),
                    Row(

                      children: [
                        TextButton(
                          child: const Text('Annulla'),
                          onPressed: () {
                            _textEditingControllerTag.clear();
                            _textEditingControllerText.clear();
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: const Text('Pubblica'),
                          onPressed: () async {
                            User _userOne = const User(
                              id: "60d0fe4f5311236168a109ca",
                            );
                            _post = Post(
                              image: 'http://www.blackelk.it/wp-content/uploads/2017/07/animali-selvatici-nelle-citt%C3%A0-BIG.jpg',
                              text: _text,
                              tags: _tag.split(', '),
                              owner: _userOne,
                            );
                            if(_post == null) {
                              Navigator.of(context).pop();
                            }
                            await ApiPost.addPost(_post);
                            _text = '';
                            _tag = '';
                            _textEditingControllerText.clear();
                            _textEditingControllerTag.clear();
                            Navigator.of(context).pop(true);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }
          );
        }
    ),
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
              onPressed: () {},
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



