import 'package:flutter/material.dart';
import 'package:social_app/components/post_card.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

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
                    height: 80,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade400,
                          blurRadius: 4,
                          offset: const Offset(4, 8), // Shadow position
                        ),
                      ],
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(32),
                        topRight: Radius.circular(32),
                      ),
                      image: const DecorationImage(
                          image: NetworkImage('https://www.wallpapertip.com/wmimgs/79-791851_sightings-free-orange-background-hd.png'),
                          fit: BoxFit.cover
                      ),
                    ),
                  ),

                  const Positioned(
                      top: 10,
                      left: 10,
                      child: Text(
                          'SanzApp', style: TextStyle(color: Colors.white, fontSize: 24),
                      )
                  )

                ],
              ),

              const SizedBox(height: 20,),

              Expanded(
                child: ListView(
                  children: [
                    PostCard(),
                    PostCard(),
                    PostCard(),
                    PostCard(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
