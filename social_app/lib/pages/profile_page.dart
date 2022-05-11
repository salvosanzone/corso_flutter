import 'package:flutter/material.dart';
import 'package:social_app/api/api_users.dart';
import 'package:social_app/models/user.dart';
import 'package:social_app/models/location.dart';

class ProfilePage extends StatefulWidget {
  // creo una variabile dove è contenuto l'id del profilo cliccato nella pagina home
  final String giveMeId;
  const ProfilePage({required this.giveMeId, Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // creo una variabile di tipo Future<User>
  late Future<User> _future;

  late TextEditingController _textEditingControllerPhone;
  late TextEditingController _textEditingControllerGender;
  late TextEditingController _textEditingControllerTitle;

  // creo la initState (parte prima della build)
  @override
  void initState() {
    // richiamo la funzione passandogli come parametro l'id effettivo
    // essendo dentro la parte stateless ho bisogno di chiamare widget.
    _future = _fetchUser(widget.giveMeId);
    _textEditingControllerPhone = TextEditingController();
    _textEditingControllerGender = TextEditingController();
    _textEditingControllerTitle = TextEditingController();

    super.initState();
  }

  // creo la funzione che prende come parametro una stringa, ovvero l'id
  // che mi andrà a prendere l'user in base all'id
  Future<User> _fetchUser(String pippo) {
    return ApiUser.getDetails(pippo);
  }

  @override
  Widget build(BuildContext context) {
    // salvo in una variabile cio che passo dall' arguments del Navigator
    //final UserId = ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
      body: FutureBuilder(
          future: _future,
          builder: (context, AsyncSnapshot<User> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            // mi creo una variabile per semplificazione
            var user = snapshot.data;
            _textEditingControllerPhone.text = user?.phone ?? '';
            _textEditingControllerGender.text = user?.gender ?? '';
            _textEditingControllerTitle.text = user?.title ?? '';

            return Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 200,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://artincontext.org/wp-content/uploads/2021/06/How-to-Make-Orange-Paint.jpg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          height: 200,
                          width: double.infinity,
                          color: Colors.black12,
                        ),
                      ],
                    ),
                    Positioned(
                      top: 20,
                      left: 10,
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/home');
                        },
                        icon: const Icon(
                          Icons.arrow_back_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 120,
                      left: MediaQuery.of(context).size.width / 2 - 80,
                      child: CircleAvatar(
                        radius: 83,
                        backgroundColor: Colors.orange,
                        child: CircleAvatar(
                          radius: 80,
                          backgroundImage: NetworkImage(
                            user?.picture ?? "https://via.placeholder.com/150"),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 100,
                ),
                Text(
                  '${user?.firstName} ${user?.lastName}',
                  style: const TextStyle(fontSize: 26),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Container(
                    height: 1,
                    color: Colors.grey.shade300,
                    width: 800,
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: ListTile(
                          leading: const Icon(Icons.phone, size: 24, color: Colors.orangeAccent,),
                          trailing: TextButton(
                            onPressed: () async {
                              var popResult = await showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                title: const Text('Modifica'),
                                content: TextField(
                                  controller: _textEditingControllerPhone,
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Annulla'),
                                  ),
                                  TextButton(
                                    child: const Text('Modifica'),
                                    onPressed: () async {
                                      var _userOne = User(
                                        id: user!.id,
                                        phone: _textEditingControllerPhone.text
                                      );
                                      await ApiUser.editUser(_userOne, _userOne.id!);
                                      Navigator.of(context).pop(true);
                                    },
                                  ),
                                ],
                              ),
                            );
                              if(popResult == true && user != null) {
                                setState(() {
                                  _future = _fetchUser(user.id!);
                                });
                              }
                            },
                            child: Text(
                                user!.phone ?? '', style: const TextStyle(fontSize: 16)
                            ),
                          ),

                        ),
                      ),

                      if(user.gender != null)
                        Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: ListTile(
                          leading: const Icon(Icons.person, size: 24, color: Colors.orangeAccent,),
                          trailing: TextButton(
                            onPressed: () async {
                              var popResult = await showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                title: const Text('Modifica'),
                                content: TextField(
                                  controller: _textEditingControllerGender,
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Annulla'),
                                  ),
                                  TextButton(
                                    child: const Text('Modifica'),
                                    onPressed: () async {
                                      var _userOne = User(
                                        id: user.id,
                                        gender: _textEditingControllerGender.text
                                      );
                                      await ApiUser.editUser(_userOne, _userOne.id!);
                                      Navigator.of(context).pop(true);
                                    },
                                  ),
                                ],
                              ),
                            );
                              if(popResult == true && user != null) {
                                setState(() {
                                  _future = _fetchUser(user.id!);
                                });
                              }
                            },
                            child: Text(
                                user.gender ?? '', style: const TextStyle(fontSize: 16)
                            ),
                          ),

                        ),
                      ),



                      if(user.title != null)
                        Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: ListTile(
                          leading: const Icon(Icons.title, size: 24, color: Colors.orangeAccent,),
                          trailing: TextButton(
                            onPressed: () async {
                              var popResult = await showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                title: const Text('Modifica'),
                                content: TextField(
                                  controller: _textEditingControllerTitle,
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Annulla'),
                                  ),
                                  TextButton(
                                    child: const Text('Modifica'),
                                    onPressed: () async {
                                      var _userOne = User(
                                        id: user.id,
                                        title: _textEditingControllerTitle.text
                                      );
                                      await ApiUser.editUser(_userOne, _userOne.id!);
                                      Navigator.of(context).pop(true);
                                    },
                                  ),
                                ],
                              ),
                            );
                              if(popResult == true && user != null) {
                                setState(() {
                                  _future = _fetchUser(user.id!);
                                });
                              }
                            },
                            child: Text(
                                user.title ?? '', style: const TextStyle(fontSize: 16)
                            ),
                          ),

                        ),
                      ),

                    ],
                  ),
                )
              ],
            );
          }),
    );
  }
}
