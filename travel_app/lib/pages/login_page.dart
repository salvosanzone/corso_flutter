import 'package:flutter/material.dart';
import 'package:travel_app/components/custom_drawer.dart';
import 'package:travel_app/components/custom_text_form_field.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text('Login Form'),
      ),
      drawer: const CustomDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      child: Align(
                        child: SizedBox(
                          width: 150,
                          height: 150,
                          child: Image.network('https://img.freepik.com/free-vector/new-user-online-registration-sign-up-concept-tiny-characters-signing-up-huge-smartphone-with-secure-password-login-account-mobile-app-web-access-cartoon-people-vector-illustration_87771-11429.jpg?w=2000'),
                        ),
                      ),
                    ),
                    const Text(
                      'Welcome back!',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'Log into your existant account of Qallure',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: CustomTextFormField(hint_text: 'Username', IconData: Icon(Icons.person_outline)),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 8),
                     // child: CustomTextFormField(hint_text: 'Password', IconData: Icon(Icons.lock_outline_rounded)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 42),
                      child: Align(
                          child:  ElevatedButton(
                            onPressed: () async {
                              if(_formKey.currentState?.validate() ?? false) {
                                SharedPreferences ss  = await SharedPreferences.getInstance();
                                // salvo la relazione chiave/valore in ss
                                ss.setBool('logKey', true);
                                Navigator.of(context).popAndPushNamed('/home');
                              }
                            },
                            child: const Text('LOG IN'),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blue.shade900,
                              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32),
                              ),
                            ),
                          )
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
