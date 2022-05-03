import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  const PostCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: AspectRatio(
        aspectRatio: 1,
        child: GestureDetector(
          onTap: () {},
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(
                color: Colors.black.withOpacity(0.2),
                width: 1,
              ),
            ),
            shadowColor: Colors.black,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Expanded(
                      child: AspectRatio(
                        aspectRatio: 3 / 2,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black54,
                                blurRadius: 4,
                                offset: Offset(4, 4), // Shadow position
                              ),
                            ],
                            image: const DecorationImage(
                              image: NetworkImage(
                                  'https://s3-eu-central-1.amazonaws.com/cartoons-s3/styles/large/s3/%D8%A7%D8%AF%D9%85%D8%A7%D9%86%20%D8%B3%D9%88%D8%B4%D9%8A%D8%A7%D9%84%20%D9%85%D9%8A%D8%AF%D9%8A%D8%A7.jpg?itok=-B2htSTT'),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const CircleAvatar(
                          radius: 36,
                          backgroundImage: NetworkImage(
                              'https://storage.googleapis.com/ares-profile-pictures/default/salvatore.sanzone-a6e2997ab3a7a9f0c9f1ae5c85c9a59c.jpg'),
                        ),
                        Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 4.0),
                              child: Text(
                                'Nome',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Icon(
                                    Icons.pin_drop,
                                    color: Colors.blue,
                                    size: 12,
                                  ),
                                  Text('Cognome',
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 12)),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
