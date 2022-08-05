import 'package:flutter/material.dart';

import 'auth_service.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String email, password;

  final formKey = new GlobalKey<FormState>();

  checkFields() {
    final form = formKey.currentState!;
    if (form.validate()) {
      return true;
    } else {
      return false;
    }
  }

  String? validateEmail(String value) {
    if (value != null || value.isNotEmpty) {
      final RegExp regex = RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)| (\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
      if (!regex.hasMatch(value!))
        return 'Enter a valid email';
      else
        return null;
    } else {
      return 'Enter a valid email';
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Colors.blueGrey, Colors.black],
            ),
          ),
          child: Center(
            child: Card(
              elevation: 14,
              shadowColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(55),
                ),
              ),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                height: size.height *
                    (size.height > 470
                        ? 0.7
                        : size.height > 470
                            ? 0.8
                            : 0.9),
                width: 500,
                color: Colors.white,
                child: Center(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(40),
                      child: Container(
                        child: Form(
                          key: formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "LOG IN",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey[700],
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Container(
                                width: 30,
                                child: const Divider(
                                  color: Colors.blueGrey,
                                  thickness: 2,
                                ),
                              ),
                              const SizedBox(
                                height: 32,
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  focusColor: Colors.blueGrey,
                                  hoverColor: Colors.blueGrey,
                                  hintText: 'Email',
                                  suffixIcon: Icon(
                                    Icons.mail_outline,
                                  ),
                                ),
                                validator: (value) => value!.isEmpty
                                    ? 'Email is required'
                                    : validateEmail(value.trim()),
                                onChanged: (value) {
                                  this.email = value;
                                },
                              ),
                              SizedBox(
                                height: 32,
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  hintText: 'Password',
                                  labelText: 'Password',
                                  suffixIcon: Icon(
                                    Icons.lock_outline,
                                  ),
                                ),
                                validator: (value) => value!.isEmpty
                                    ? 'Password is required'
                                    : null,
                                onChanged: (value) {
                                  this.password = value;
                                },
                              ),
                              SizedBox(
                                height: 64,
                              ),
                              const SizedBox(
                                height: 32,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "You do not have an account?",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  GestureDetector(
                                    child: Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            if (checkFields()) {
                                              AuthService()
                                                  .signIn(email, password);
                                            }
                                          },
                                          child: const Text(
                                            "Siqn In",
                                            style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Icon(
                                          Icons.arrow_forward,
                                          color: Colors.blueGrey,
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
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
