import 'package:flutter/material.dart';
import 'package:users_json/api/api_users.dart';
import 'package:users_json/models/users_response.dart';
import 'package:users_json/models/users.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // creo delle variabili di stato
  late List<Users> _listOfUsers;
  late bool _hasMoreUsers;
  late int _skipUsers;
  late Future<List<Users>> _future;

  // creo la funzione initState() dove andrò ad inizializzare le variabili
  @override
  void initState() {
    super.initState();
    inizializeInitVariables();

  }

  // creo una funzione che andrà a recuperare gli users e ad aggiornare le variabili
  Future <List<Users>> _fetchUsers() async {
    final UsersResponse result = await ApiUsers.getUsersFromInternet(skip: _skipUsers);

    setState(() {
      _skipUsers = _skipUsers + result.limit;
      _hasMoreUsers = (result.total - _skipUsers > 0);
      _listOfUsers = _listOfUsers + result.users;

    });

    return _listOfUsers;

  }

  void inizializeInitVariables() {
    _listOfUsers = [];
    _hasMoreUsers = false;
    _skipUsers = 0;
    _future = _fetchUsers();
  }


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
        child: RefreshIndicator(
          onRefresh: () {
            setState(() {
              inizializeInitVariables();
            });
            return Future.value();
          },
          child: FutureBuilder(
            future: _future,
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data is List<Users>) {

                //salvo in listUsers tutti gli users
                final listUsers = (snapshot.data as List<Users>);

                // stampo gli users utilizzando come chiave username e lastName
                return ListView.builder(
                    itemCount: listUsers.length + (_hasMoreUsers ? 1 : 0),
                    itemBuilder: (context, index) {
                      if(index == _listOfUsers.length) {
                        _future = _fetchUsers();

                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
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
                          title: Text('First Name: ${listUsers[index].firstName}'),
                          subtitle: Text('Last Name: ${listUsers[index].lastName}'),
                          trailing: Text('Age: ${listUsers[index].age}'),
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
      ),
    );
  }
}
