import 'package:flutter/material.dart';
import 'package:social_app/api/api_users.dart';
import 'package:social_app/components/login_card.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // richiamo la classe ApiUser e uno dei suoi metodi
    ApiUser.getDetails('60d0fe4f5311236168a109ca');

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 250,
                decoration: const BoxDecoration(
                  color: Colors.orange,
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(82)),
                ),
              ),
              const Positioned(
                left: 140,
                top: 50,
                child: CircleAvatar(
                  radius: 70,
                  backgroundImage: NetworkImage(
                      'https://user.rmartonline.com/app-assets/images/pages/login.png'),
                  backgroundColor: Colors.transparent,
                ),
              ),
              const Positioned(
                  bottom: 10,
                  right: 10,
                  child:
                      Text('SanzApp', style: TextStyle(color: Colors.white, fontSize: 16))),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Expanded(
                child: LoginCard(
                  firstName: 'Sara',
                  lasttName: 'Andersen',
                  id: '60d0fe4f5311236168a109ca',
                  imageUrl: 'https://randomuser.me/api/portraits/women/58.jpg',
                ),
              ),Expanded(
                child: LoginCard(
                  firstName: 'Edita',
                  lasttName: 'Vestering',
                  id: '60d0fe4f5311236168a109cb',
                  imageUrl: 'https://randomuser.me/api/portraits/med/women/89.jpg',
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 60,
          ),
          const Text(
              'Scegli con quale account entrare!', style: TextStyle(color: Colors.blueAccent, fontSize: 20),
          ),
          const SizedBox(
            height: 40,
          ),
          OutlinedButton.icon(
            icon: const Icon(Icons.person_outline),
            label: const Text("Login"),
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              side: const BorderSide(width: 2.0, color: Colors.blueAccent),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
            ),
          )

        ],
      ),
    );
  }
}
