import 'package:flutter/material.dart';
import 'package:my_insta/components/post_ss.dart';
import 'package:my_insta/components/stories.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  // qui inserisco le variabili
  int posts = 135;
  int followers = 16;
  int followings = 122;
  String name = 'Salvatore Sanzone';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: const Icon(Icons.chevron_left, color: Colors.black),
        title: const Text(
          'salvatore.sanzone',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.more_horiz, color: Colors.black),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stories(
                  text: '',
                  size: 90,
                  size_inset: 70,
                  url_stories: 'assets/foto-profilo.jpg',
                ),
                Column(
                  children: [
                    Text(
                      posts.toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Text('Posts')
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '${followers.toString()}k',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Text('Followers')
                  ],
                ),
                Column(
                  children: [
                    Text(
                      followings.toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                content: SizedBox(
                                  width: 150,
                                  height: 300,
                                  child: ListView(
                                    scrollDirection: Axis.vertical,
                                    children: const [
                                      ListTile(
                                        leading: Icon(Icons.person),
                                        title: Text('Josef Koudelka'),
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.person),
                                        title: Text('Gilles Peress'),
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.person),
                                        title: Text('James Nachtwey'),
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.person),
                                        title: Text('Jason Eskenazi'),
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.person),
                                        title: Text('Jason Eskenazi'),
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.person),
                                        title: Text('Jason Eskenazi'),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                              },
                            );
                        },
                        child: const Text(
                          'Followings',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                          ),
                        )),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const Text(
              'Photographer',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            const Text(
              '•From Sicily 🇮🇹',
              style: TextStyle(),
            ),
            const Text(
              '•Documentary Photography 📷',
              style: TextStyle(),
            ),
            RichText(
              text: const TextSpan(
                  text: 'Followed by ',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                  children: [
                    TextSpan(
                      text: 'j_koudelka,',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    TextSpan(
                      text: 'magnum_photo, and olthers',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade400),
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Following'),
                              IconButton(
                                padding: const EdgeInsets.only(bottom: 0),
                                constraints:
                                    const BoxConstraints(maxHeight: 25),
                                icon: const Icon(Icons.expand_more),
                                onPressed: () {
                                  ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  backgroundColor: Colors.indigo,
                                  content: Text('Stai seguendo $name'),
                                ));
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade400),
                            borderRadius: BorderRadius.circular(5)),
                        child: const Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Center(child: Text('Message')),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade400),
                            borderRadius: BorderRadius.circular(5)),
                        child: const Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Center(child: Text('Contact')),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(5)),
                    child: const Icon(Icons.expand_more),
                  ),
                ],
              ),
            ),
            SizedBox(
              child: ListView(scrollDirection: Axis.horizontal, children: [
                Stories(
                  text: 'Eskenazi',
                  size: 60,
                  size_inset: 40,
                  url_stories: 'assets/eskenazi.jpg',
                ),
                Stories(
                  text: 'Nachtwey',
                  size: 60,
                  size_inset: 40,
                  url_stories: 'assets/nachtwey.jpg',
                ),
                Stories(
                  text: 'Koudelka',
                  size: 60,
                  size_inset: 40,
                  url_stories: 'assets/koudelka3.jpg',
                ),
                Stories(
                  text: 'Peress',
                  size: 60,
                  size_inset: 40,
                  url_stories: 'assets/peress.jpg',
                ),
                Stories(
                  text: 'Peress',
                  size: 60,
                  size_inset: 40,
                  url_stories: 'assets/peress1.jpg',
                ),
                Stories(
                  text: 'Koudelka',
                  size: 60,
                  size_inset: 40,
                  url_stories: 'assets/koudelka2.jpg',
                ),
                Stories(
                  text: 'Koudelka',
                  size: 60,
                  size_inset: 40,
                  url_stories: 'assets/koudelka.jpg',
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(color: Colors.grey.shade400, height: 1),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      decoration: const BoxDecoration(
                          border: BorderDirectional(
                              bottom:
                                  BorderSide(width: 2, color: Colors.black))),
                      child: const Center(
                          child: Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Icon(Icons.grid_on),
                      )),
                    ),
                  ),
                ),
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(2.0),
                    child: Center(
                        child: Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Icon(Icons.live_tv, color: Colors.grey),
                    )),
                  ),
                ),
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(2.0),
                    child: Center(
                        child: Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child:
                          Icon(Icons.person_pin_outlined, color: Colors.grey),
                    )),
                  ),
                ),
              ],
            ),
            GridView.count(
              scrollDirection: Axis.vertical,
              mainAxisSpacing: 2,
              crossAxisSpacing: 2,
              crossAxisCount: 3,
              shrinkWrap: true,
              children: [
                PostSs(url_post: 'assets/post.jpg'),
                PostSs(url_post: 'assets/post1.jpg'),
                PostSs(url_post: 'assets/post2.jpg'),
                PostSs(url_post: 'assets/post3.jpg'),
                PostSs(url_post: 'assets/post4.jpg'),
                PostSs(url_post: 'assets/post5.jpg'),
                PostSs(url_post: 'assets/post6.jpg'),
                PostSs(url_post: 'assets/post7.jpg'),
                PostSs(url_post: 'assets/post8.jpg'),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Icon(Icons.home_outlined),
            Icon(Icons.search),
            Icon(Icons.add_box_outlined),
            Icon(Icons.favorite_border),
            Icon(Icons.person),
          ],
        ),
      ),
    );
  }
}
