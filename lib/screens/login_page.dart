import 'package:flutter/material.dart';
import 'package:pingo_news/providers/login_provider.dart';
import 'package:pingo_news/screens/registration_page.dart';
import 'package:provider/provider.dart';

import 'comments_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                Visibility(
                  visible: prov.validation != null,
                  child: Center(
                    child: Text(prov.validation ?? ''),
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
                          color: Color(0xff0c54be),
                        ),
                      ),
                      onPressed: () async {
                        await prov
                            .login(AuthenticationType.login)
                            .whenComplete(() {
                          if (prov.isLoggedIn ?? false) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CommentsPage(),
                              ),
                            );
                          }
                        });
                      },
                      child: const Text('Login'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "New Here?",
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
                                builder: (context) => const RegistrationPage(),
                              ),
                            );
                          },
                          child: const Text(
                            "SignUp",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 20.0,
                              color: Color(0xff0c54be),
                              fontWeight: FontWeight.bold,
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
