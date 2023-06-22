import 'package:bignews/admin_Area/pages/homepage/overview.dart';
import 'package:bignews/admin_Area/pages/homepage/post_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";

import '../account_Reg_screen/loginPage.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 7), () {
      // Navigator.of(context).pushAndRemoveUntil(
      //     MaterialPageRoute(builder: (context) => const LoginPage()),
      //     (route) => false);
      final auth = FirebaseAuth.instance;

      // ignore: unnecessary_null_comparison
      if (auth.currentUser?.uid == null) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const LoginPage()),
            (route) => false);
      } else {
        // Navigator.of(context).pushAndRemoveUntil(
        //     MaterialPageRoute(builder: (context) => const ActivityPage()),
        //     (route) => false);

        FirebaseFirestore.instance
            .collection("usersData")
            .doc(auth.currentUser!.uid)
            .get()
            .then((DocumentSnapshot result) => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const AdminDashboard())))
            .catchError((err) => print(err));
      }
    });

    return Scaffold(
        body: Stack(children: [
      Align(
          alignment: Alignment.center,
          child: Image.asset("images/logo/logo1.jpeg")),
      const SizedBox(
        height: 30,
      ),
      const Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 60),
            child: CircularProgressIndicator(
                color: Color.fromARGB(255, 60, 73, 252)),
          ))
    ]));
  }
}
