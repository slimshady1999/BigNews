import 'package:bignews/account_Reg_screen/loginPage.dart';
import 'package:bignews/client_Area/pages/homePage/drawer.dart';
import 'package:bignews/client_Area/pages/homePage/notifications.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import "package:flutter/material.dart";

class ActivityPage extends StatefulWidget {
  const ActivityPage({super.key, this.title, this.uid});

  // ignore: prefer_typing_uninitialized_variables
  final title;
  // ignore: prefer_typing_uninitialized_variables
  final uid;

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  @override
  void initState() {
    super.initState();
    /* final auth = FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        setState(() {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const LoginPage()),
              (route) => false);
        });
        if (kDebugMode) {
          print('User is currently signed out!');
        }
      } else {
        if (kDebugMode) {
          print('User is signed in!');
        }
      }
    }); */
  }

  // String? user = FirebaseAuth.instance.currentUser?.uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "New Feeds",
          style: TextStyle(
              fontFamily: "Poppins-Regular",
              fontWeight: FontWeight.w800,
              fontSize: 20,
              color: Color.fromARGB(255, 65, 65, 65)),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Notifications()));
              },
              icon: const Icon(Icons.notifications,
                  color: Color.fromARGB(255, 60, 73, 252))),
        ],
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 100, 100, 100),
        ),
      ),
      drawer: const Drawer(
        child: MyDrawer(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Center(
            child: Text(
              "No posts yet",
              style: TextStyle(
                  fontFamily: "RubikVinyl-Regular",
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                  color: Color.fromARGB(255, 70, 70, 70)),
            ),
          )
        ],
      ),
    );
  }
}
