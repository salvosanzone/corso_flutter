import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // salvo in una variabile cio che passo dall' arguments del Navigator
    //final UserId = ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
      body: Column(
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
                        image: NetworkImage("https://img.dummyapi.io/photo-1515376721779-7db6951da88d.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: 200,
                    width: double.infinity,
                    color: Colors.black38,
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
                  icon: const Icon(Icons.arrow_back_rounded, color: Colors.white,),
                ),
              ),
              Positioned(
                top: 120,
                left: MediaQuery.of(context).size.width / 2 - 80,
                child: const CircleAvatar(
                  radius: 80,
                  backgroundImage: NetworkImage(
                      "https://randomuser.me/api/portraits/women/58.jpg"
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 100,),
          const Text(
            'Sara Vaughan', style: TextStyle(fontSize: 26),
          ),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 1,
              color: Colors.grey.shade400,
              width: 800,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Icon(Icons.person),
                      Text('sara'),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
