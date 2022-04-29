import 'package:flutter/material.dart';
import 'package:users_json/api/api_users.dart';
import 'package:users_json/models/users_response.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: const Text('Users'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: ApiUsers.getUsersFromInternet(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data is UsersResponse) {

              //salvo in listUsers tutti gli users
              final listUsers = (snapshot.data as UsersResponse).users;

              // stampo gli users utilizzando come chiave username e lastName
              return ListView.builder(
                  itemCount: listUsers.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: const Offset(3, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: ListTile(
                        title: Text(listUsers[index].username),
                        subtitle: Text(listUsers[index].lastName),
                      ),
                    );
                  });
            }
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
