import 'package:bignews/account_Reg_screen/loginPage.dart';
import 'package:bignews/account_Reg_screen/registerPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import "package:flutter/material.dart";

import '../admin_Area/pages/homepage/overview.dart';
import '../client_Area/pages/homePage/new_feeds.dart';

class AdminLoginPage extends StatefulWidget {
  const AdminLoginPage({super.key});

  @override
  State<AdminLoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<AdminLoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  loginUsers() async {
    try {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return const AlertDialog(
            title: Text("Welcome Admin"),
            content: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: CircularProgressIndicator(
                  color: Color.fromARGB(255, 60, 73, 252)),
            ),
          );
        },
      );

      await auth.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
      // userCredential.credential?.signInMethod;
      if (_emailController.text.trim() == "bignews2023@gmail.com" &&
          _passwordController.text.trim() == "@BigNews2023") {
        // ignore: use_build_context_synchronously

        Future.delayed(const Duration(seconds: 5), () {
          return Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const AdminDashboard()),
              (route) => false);
        });
      } else {
        return null;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak password") {
        Navigator.pop(context);

        showDialog(
          builder: (context) {
            return const AlertDialog(
              title: Text('Weak Password'),
              content: Text('Password is weak'),
            );
          },
          context: context,
        );
      } else if (e.code == "Email already in use") {
        Navigator.pop(context);

        showDialog(
          builder: (context) {
            return AlertDialog(
              title: const Text('Email registered'),
              content: Text(e.toString()),
            );
          },
          context: context,
        );
      } else if (e.code == "Wrong Email") {
        // ignore: prefer_typing_uninitialized_variables

        Navigator.pop(context);
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Wrong Email'),
              content: Text(e.toString()),
            );
          },
        );
      }
    }
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 60, 73, 252),
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(65))),
              child: const Center(
                child: Text(
                  "Welcome Admin",
                  style: TextStyle(
                      fontFamily: "RubikVinyl-Regular",
                      fontWeight: FontWeight.w700,
                      fontSize: 35,
                      color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 50),
            // loginPage(context)

            Container(
              height: MediaQuery.of(context).size.height / 1.90,
              width: MediaQuery.of(context).size.width,
              // color: Colors.red,
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(children: [
                  SizedBox(
                    height: 45,
                    width: MediaQuery.of(context).size.width / 1.1,
                    child: TextFormField(
                      controller: _emailController,
                      validator: (email) {
                        if (email != null && email.contains("@gmail.com") ||
                            email!.contains("@yahoo")) {
                          return null;
                        } else {
                          return ("email not valid");
                        }
                      },
                      decoration: const InputDecoration(
                          hintText: "Email", border: UnderlineInputBorder()),
                    ),
                  ),

                  // Paaword field //

                  const SizedBox(height: 30),
                  SizedBox(
                    height: 45,
                    width: MediaQuery.of(context).size.width / 1.1,
                    child: TextFormField(
                      controller: _passwordController,
                      validator: (password) {
                        // ignore: unrelated_type_equality_checks
                        if (password!.length >= 6) {
                          return null;
                        } else {
                          return ("password must be 6 characters long");
                        }
                      },
                      decoration: const InputDecoration(
                          hintText: "Password", border: UnderlineInputBorder()),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: MediaQuery.of(context).size.width / 1.1,
                    child: Material(
                      color: const Color.fromARGB(255, 60, 73, 252),
                      borderRadius: BorderRadius.circular(20),
                      child: InkWell(
                        onTap: () {
                          if (kDebugMode) {
                            print(_passwordController.text.trim());
                          }
                          if (kDebugMode) {
                            print(_emailController.text.trim());
                          }
                          loginUsers();
                          // if (_formKey.currentState!.validate()) {
                          //   showDialog(
                          //     context: context,
                          //     builder: (BuildContext context) {
                          //       return const AlertDialog(
                          //         title: Text("Welcome Admin"),
                          //         content: CircleAvatar(
                          //           backgroundColor: Colors.transparent,
                          //           child: CircularProgressIndicator(
                          //               color:
                          //                   Color.fromARGB(255, 60, 73, 252)),
                          //         ),
                          //       );
                          //     },
                          //   ).then((value) =>
                          //       Future.delayed(const Duration(seconds: 7), () {
                          //         return
                          //       }));
                          // } else {
                          //   if (_formKey.currentState!.validate()) {

                          //   }
                          // }
                        },
                        borderRadius: BorderRadius.circular(20),
                        child: const Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                                fontFamily: "Poppins-Regular",
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "just joining us?",
                        style: TextStyle(
                            fontFamily: "Poppins-Regular",
                            fontWeight: FontWeight.w300,
                            fontSize: 15,
                            color: Color.fromARGB(255, 37, 37, 37)),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => RegisterPage()),
                              (route) => false);
                        },
                        child: const Text(
                          "Register",
                          style: TextStyle(
                              fontFamily: "Poppins-Regular",
                              fontWeight: FontWeight.w800,
                              fontSize: 19,
                              color: Color.fromARGB(255, 60, 73, 252)),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 17),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                          (route) => false);
                    },
                    child: const Text(
                      "Login as user",
                      style: TextStyle(
                          fontFamily: "Poppins-Regular",
                          fontWeight: FontWeight.w800,
                          fontSize: 19,
                          color: Color.fromARGB(255, 60, 73, 252)),
                    ),
                  )
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
