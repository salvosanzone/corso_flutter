import 'package:flutter/material.dart';
import 'package:social_app/api/api_post.dart';
import 'package:social_app/components/container_post.dart';
import 'package:social_app/components/post_card.dart';
import 'package:social_app/models/post.dart';
import 'package:social_app/models/post_response.dart';
import 'package:social_app/models/user.dart';



class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
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
                  Container(
                    height: 200,
                    decoration: const BoxDecoration(
                      color: Colors.white12,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(80),
                        topRight: Radius.circular(80),
                      ),
                    ),
                  ),
                  const Positioned(
                      top: 10,
                      left: 10,
                      child: Text(
                          'SanzApp', style: TextStyle(color: Colors.white, fontSize: 24),
                      )
                  ),
                  Positioned(
                      bottom: 10,
                      right: 10,
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(
                            '/profile',

                            // passo al click alla pagina del profilo l'id
                            arguments: {}
                          );

                        },
                        icon: const Icon(Icons.person, color: Colors.white,),
                      )
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              const Expanded(
                child: ContainerPost(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
