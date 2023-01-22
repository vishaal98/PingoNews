import 'package:flutter/material.dart';
import 'package:pingo_news/screens/login_page.dart';
import 'package:provider/provider.dart';

import '../providers/login_provider.dart';
import 'comments_page.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Consumer<LoginProvider>(builder: (context, prov, _) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Text(
                      "Comments",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 25,
                        color: Color(0xff0c54be),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Name',
                            hintStyle: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.bold,
                              color: Color(0xff303f60),
                            ),
                          ),
                          onChanged: (value) {
                            prov.name = value;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Email',
                            hintStyle: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.bold,
                              color: Color(0xff303f60),
                            ),
                          ),
                          onChanged: (value) {
                            prov.email = value;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Password',
                            hintStyle: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.bold,
                              color: Color(0xff303f60),
                            ),
                          ),
                          onChanged: (value) {
                            prov.password = value;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        backgroundColor: Colors.blue[900],
                        padding: const EdgeInsets.symmetric(
                            horizontal: 100, vertical: 15),
                        textStyle: const TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () async {
                        await prov
                            .login(AuthenticationType.signUp)
                            .whenComplete(() {
                          if (prov.isSignedUp ?? false) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CommentsPage(),
                              ),
                            );
                          }
                        });
                      },
                      child: const Text('SignUp'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account?",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 20,
                            color: Color(0xff303f60),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ),
                            );
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff0c54be),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
