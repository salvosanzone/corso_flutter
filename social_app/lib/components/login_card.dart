import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



class LoginCard extends StatelessWidget {


  final String firstName;
  final String lasttName;
  final String id;
  final String imageUrl;

  const LoginCard({required this.id, required this.firstName, required this.imageUrl, required this.lasttName, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async{
        SharedPreferences ss = await SharedPreferences.getInstance();

        // al click passo l'id dell'elemento e lo setto con la key
        ss.setString('idKey', id);
        Navigator.of(context).pushNamed('/home');
      } ,
      child: SizedBox(
        height: 200,
        child: Card(
            elevation: 16,
            color: Colors.orange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                  firstName, style: const TextStyle(color: Colors.white, fontSize: 24),
                  ),Text(
                  lasttName, style: const TextStyle(color: Colors.white, fontSize: 24),
                  ),Text(
                  id, style: const TextStyle(color: Colors.white, fontSize: 10),
                  ),
                CircleAvatar(
                  radius: 36,
                  backgroundImage: NetworkImage(imageUrl),
                ),
              ],
              ),
            )
        ),
      ),
    );
  }
}
