import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/components/custom_button.dart';
import 'package:travel_app/components/picture_card.dart';
import 'package:travel_app/models/meta_turistica.dart';

class DetailMeta extends StatelessWidget {
  final MetaTuristica meta;
  const DetailMeta(this.meta, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                child: Container(
                  height: 400,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.9), BlendMode.modulate,),
                      fit: BoxFit.cover,
                      image: NetworkImage(meta.imageUrl),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(24),
                        topLeft: Radius.circular(24),
                      )),
                ),
              ),
              Positioned(
                left: 24,
                top: 32,
                child: CustomButton(
                    icon: (Icons.chevron_left), colore: Colors.grey.shade200),
              ),
              Positioned(
                  right: 24,
                  top: 32,
                  child: CustomButton(
                    icon: (Icons.bookmark_outlined),
                    colore: Colors.grey.shade200,
                  )),
              Positioned(
                top: 250,
                left: 55,
                child: Container(
                  width: 300,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(16),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(4, 8), // Shadow position
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                                meta.city, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                            ),
                            Row(
                              children: [
                                const Icon(Icons.pin_drop, color: Colors.indigo,),
                                Text(
                                  meta.country, style: const TextStyle(color: Colors.indigo),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: const [
                                Icon(Icons.calendar_month_outlined, color: Colors.green, ),
                                Text(
                                  '2 Day', style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),Row(
                              children: [
                                const Icon(Icons.grade_outlined, color: Colors.deepOrange, ),
                                Text(
                                  meta.rating.toString(), style: const TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),Row(
                              children: const [
                                Icon(Icons.my_location_outlined, color: Colors.purple, ),
                                Text(
                                  '12 PM Italia', style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  const Text(
                      'Great Place To Visit', style: TextStyle(fontSize: 24),
                  ),Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: SizedBox(
                      child: Text(
                        meta.description, style: const TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  const Text('Picture',style: TextStyle(fontSize: 24),),
                  SizedBox(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: const [
                        PictureCard('https://i.pinimg.com/originals/8f/bf/4e/8fbf4ea9f72e0a48fbc6819e4548eff9.jpg'),
                        PictureCard('https://i.pinimg.com/736x/5a/76/0b/5a760bb28bd7cb200cf0e7029d8ad1d9.jpg'),
                        PictureCard('https://i.pinimg.com/originals/26/5b/d2/265bd2ea96d71ec45028ac4831cce2fe.jpg'),
                        PictureCard('https://www.vcbay.news/wp-content/uploads/2020/11/aqw.jpg'),
                        PictureCard('https://wallpaperaccess.com/full/5502889.jpg'),
                      ],
                    ),
                  ),const SizedBox(
                    height: 200,
                    child: PictureCard('https://t4.ftcdn.net/jpg/03/16/58/11/360_F_316581152_fRZlFTyoN3fWIoetsG5A0qu2k1UUdXP9.jpg'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              meta.maxPrice.toString(), style: const TextStyle(fontWeight: FontWeight.bold),
                            ),const Text(
                              'Totale', style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            child: const Text(
                                'Book Now'
                            ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
