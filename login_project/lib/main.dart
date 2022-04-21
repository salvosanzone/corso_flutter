import 'package:flutter/material.dart';
import 'package:login_project/componentes/drawer_component.dart';
import 'package:login_project/componentes/text_form_field_custom.dart';
import 'package:login_project/pages/create_account.dart';

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
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formkey = GlobalKey<FormState>();
  final _controllerNameHomePage = TextEditingController();
  final _controllerPasswordHomePage = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text('Login Form'),
      ),
      drawer: const DrawerComponent(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: _formkey,
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      child: Align(
                        child: SizedBox(
                          width: 150,
                          height: 150,
                          child: Image.asset('assets/login.jpg'),
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
                     Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: TextFormFieldCustom(hint_text: 'example@gmail.com', IconData: Icon(Icons.person_outline), controllerForm: _controllerNameHomePage,),
                    ),
                     Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: TextFormFieldCustom(hint_text: 'Password', IconData: Icon(Icons.lock_outline_rounded), controllerForm: _controllerPasswordHomePage,),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(bottom: 16),
                          child: Text(
                            'Forgot Password?', style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold
                          ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Align(
                        child:  ElevatedButton(
                          onPressed: () {},
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(top: 16, bottom: 8),
                          child: Text(
                            'Or connetting using', style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold
                          ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('Facebook'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue.shade800,
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('Google'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 24),
                          child: Row(
                            children: [
                              Text(
                                "Don't have an account?",
                                style: TextStyle(
                                  color: Colors.blue.shade800,
                                ),
                              ),
                              TextButton(
                                  onPressed: () => Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) => CreateAccount())
                                  ),
                                  child: const Text(
                                    'Sign up',
                                    style: TextStyle(color: Colors.blueAccent),
                                  ),
                              ),
                            ],
                          ),
                        ),
                      ],
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
