import 'dart:math';

import 'package:bignews/account_Reg_screen/loginPage.dart';
import 'package:bignews/admin_Area/pages/homepage/overview.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:random_string/random_string.dart';
import '../client_Area/pages/homePage/new_feeds.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _fullNameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  registerUsers() async {
    final auth = FirebaseAuth.instance;

    try {
      await auth
          .createUserWithEmailAndPassword(
              email: _emailController.text.trim(),
              password: _passwordController.text.trim())
          .then((currentUser) => addUserData(
                _fullNameController.text.trim(),
                _emailController.text.trim(),
                currentUser.user!.uid,
              ));
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

// Add users data to firestore //
  Future addUserData(String fullname, String email, String uid) async {
    await FirebaseFirestore.instance
        .collection("usersData")
        .add({"fullname": fullname, "email": email, "uid": uid});
  }

  final formKey = GlobalKey();

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
                  "Register",
                  style: TextStyle(
                      fontFamily: "RubikVinyl-Regular",
                      fontWeight: FontWeight.w700,
                      fontSize: 50,
                      color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 30),
            // loginPage(context)
            Container(
              height: MediaQuery.of(context).size.height / 1.60,
              width: MediaQuery.of(context).size.width,
              child: Form(
                key: formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(children: [
                  SizedBox(
                    height: 45,
                    width: MediaQuery.of(context).size.width / 1.1,
                    child: TextFormField(
                      controller: _fullNameController,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person,
                              color: Color.fromARGB(255, 60, 73, 252)),
                          hintText: "Fullname",
                          border: UnderlineInputBorder()),
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    height: 45,
                    width: MediaQuery.of(context).size.width / 1.1,
                    child: TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (email) {
                        if (email != null && email.contains("@gmail.com") ||
                            email!.contains("@yahoo")) {
                          return null;
                        } else {
                          return ("email not valid");
                        }
                      },
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.mail,
                              color: Color.fromARGB(255, 60, 73, 252)),
                          hintText: "Email",
                          border: UnderlineInputBorder()),
                    ),
                  ),

                  // Password field //

                  const SizedBox(height: 30),
                  SizedBox(
                    height: 45,
                    width: MediaQuery.of(context).size.width / 1.1,
                    child: TextFormField(
                      controller: _passwordController,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      validator: (password) {
                        // ignore: unrelated_type_equality_checks
                        if (password!.length >= 6) {
                          return null;
                        } else {
                          return ("password must be 6 characters long");
                        }
                      },
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.lock,
                              color: Color.fromARGB(255, 60, 73, 252)),
                          hintText: "Password",
                          border: UnderlineInputBorder()),
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
                          if (_emailController.text.trim() ==
                                  "bignews2023@gmail.com" &&
                              _passwordController.text.trim() ==
                                  "@BigNews2023") {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const AlertDialog(
                                  title: Text('Admin'),
                                  content: CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    child: CircularProgressIndicator(
                                        color:
                                            Color.fromARGB(255, 60, 73, 252)),
                                  ),
                                );
                              },
                            );
                            Future.delayed(const Duration(seconds: 7), () {
                              registerUsers();
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const AdminDashboard()),
                                  (route) => false);
                            });
                          } else {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const AlertDialog(
                                  content: CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    child: CircularProgressIndicator(
                                        color:
                                            Color.fromARGB(255, 60, 73, 252)),
                                  ),
                                );
                              },
                            );
                            Future.delayed(const Duration(seconds: 7), () {
                              registerUsers();
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ActivityPage()),
                                  (route) => false);
                            });
                          }
                        },
                        borderRadius: BorderRadius.circular(20),
                        child: const Center(
                          child: Text(
                            "Register",
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
                        "already a member?",
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
                                  builder: (context) => const LoginPage()),
                              (route) => false);
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(
                              fontFamily: "Poppins-Regular",
                              fontWeight: FontWeight.w800,
                              fontSize: 19,
                              color: Color.fromARGB(255, 60, 73, 252)),
                        ),
                      )
                    ],
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
