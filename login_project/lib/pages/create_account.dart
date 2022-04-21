import 'package:flutter/material.dart';
import 'package:login_project/componentes/text_alert_dialog.dart';
import 'package:login_project/componentes/text_form_field_custom.dart';
import 'package:login_project/main.dart';

class CreateAccount extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();
  final _controllerName = TextEditingController();
  final _controllerEmail = TextEditingController();
  final _controllerPhone = TextEditingController();
  final _controllerPassword = TextEditingController();
  final _controllerConfirmPassword = TextEditingController();
  CreateAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          color: Colors.black,
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Form(
                key: _formkey,
                child: ListView(
                  children: [
                      const Text(
                      "Let's Get Started!",
                      style: TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold
                      ),
                    ),
                     const Text(
                      'Create an account to Q Allure to get all features',
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: TextFormFieldCustom(hint_text: 'Name', IconData: const Icon(Icons.person_outline), controllerForm: _controllerName,),
                    ),Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: TextFormFieldCustom(hint_text: 'Email', IconData: const Icon(Icons.email_outlined), controllerForm: _controllerEmail,),
                    ),Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: TextFormFieldCustom(hint_text: 'Phone', IconData: const Icon(Icons.phone_android_sharp), controllerForm: _controllerPhone),
                    ),Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: TextFormFieldCustom(hint_text: 'Password', IconData: const Icon(Icons.lock_outline_rounded), controllerForm: _controllerPassword),
                    ),Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: TextFormFieldCustom(hint_text: 'Confirm Password', IconData: const Icon(Icons.lock_outline_rounded), controllerForm: _controllerConfirmPassword),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Align(
                          child:  ElevatedButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    content: Column(
                                      children: [
                                        TextAlertDialog(text: "Il nome inserito è ${_controllerName.text}"),
                                        TextAlertDialog(text: "L'email inserita è ${_controllerEmail.text}"),
                                        TextAlertDialog(text: "Il numero inserito è ${_controllerPhone.text}"),
                                      ],
                                    ),
                                  ),
                              );
                              return _formkey.currentState?.save();
                            },
                            child:  const Text('CREATE'),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blue.shade900,
                              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32),
                              ),
                            ),
                          ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 24),
                          child: Row(
                            children: [
                              Text(
                                "Already have an account?",
                                style: TextStyle(
                                  color: Colors.blue.shade800,
                                ),
                              ),
                              TextButton(
                                onPressed: () => Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) => const MyHomePage())
                                ),
                                child: const Text(
                                  'Login here',
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
          ],
        ),
      ),

    );
  }
}
