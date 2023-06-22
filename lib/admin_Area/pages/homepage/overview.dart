import 'package:bignews/admin_Area/pages/account/ads_integration.dart';
import 'package:bignews/admin_Area/pages/homepage/notifications.dart';
import 'package:bignews/admin_Area/pages/homepage/number_of_users.dart';
import 'package:bignews/admin_Area/pages/homepage/post_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import "package:flutter/material.dart";
import 'drawer.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  final auth = FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      if (kDebugMode) {
        print('User is currently signed out!');
      }
    } else {
      if (kDebugMode) {
        print('User is signed in!');
        const Text("sign in");
      }
    }
  });
  @override
  Widget build(BuildContext context) {
    final List item = ["create post", "create page"];
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text(
            "Admin OverView",
            style: TextStyle(
                fontFamily: "Poppins-Regular",
                fontWeight: FontWeight.w800,
                fontSize: 15,
                color: Color.fromARGB(255, 60, 73, 252)),
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
          elevation: 0,
          iconTheme:
              const IconThemeData(color: Color.fromARGB(255, 66, 66, 66)),
        ),
        drawer: const Drawer(child: MyDrawer()),
        floatingActionButton: FloatingActionButton(
            backgroundColor: const Color.fromARGB(255, 60, 73, 252),
            onPressed: () {},
            child: const Icon(Icons.add)),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: SingleChildScrollView(
            child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Greetings //
              const Padding(
                padding: EdgeInsets.only(left: 10.0, top: 20),
                child: Text(
                  "Hello, Welcome Back",
                  style: TextStyle(
                      fontFamily: "Poppins-Regular",
                      fontWeight: FontWeight.w800,
                      fontSize: 19,
                      color: Color.fromARGB(255, 58, 58, 58)),
                ),
              ),

              // OverView Stat //

              const SizedBox(
                height: 30,
              ),

              Container(
                height: 124,
                width: MediaQuery.of(context).size.width,
                // color: Colors.blue,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const UsersList()));
                            },
                            child: Container(
                              height: 120,
                              width: 110,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: Icon(Icons.person,
                                          color: Color.fromARGB(
                                              255, 60, 73, 252))),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 30.0),
                                    child: Text(
                                      "Users",
                                      style: TextStyle(
                                          fontFamily: "Poppins-Regular",
                                          fontWeight: FontWeight.w800,
                                          fontSize: 19,
                                          color: Color.fromARGB(
                                              255, 255, 255, 255)),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 30.0),
                                    child: Container(
                                      height: 35,
                                      child: StreamBuilder(
                                        stream: FirebaseFirestore.instance
                                            .collection("usersData")
                                            .snapshots(),
                                        builder: (context,
                                            AsyncSnapshot<QuerySnapshot>
                                                snapshot) {
                                          if (snapshot.hasData) {
                                            return ListView.builder(
                                                itemCount:
                                                    snapshot.data!.docs.length,
                                                itemBuilder: (context, index) {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      "(${snapshot.data!.docs.length})",
                                                      style: const TextStyle(
                                                        fontFamily:
                                                            "Poppins-Regular",
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 19,
                                                        color: Color.fromARGB(
                                                            255, 255, 255, 255),
                                                      ),
                                                    ),
                                                  );
                                                });
                                          } else if (snapshot.hasError) {
                                            return Text(
                                                snapshot.error.toString());
                                          }
                                          return const Text("Loading users");
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        // Box 2 //

                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const ActivityPage()));
                          },
                          child: Container(
                            height: 120,
                            width: 110,
                            decoration: BoxDecoration(
                                color: Colors.pink,
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: Icon(Icons.post_add,
                                        color:
                                            Color.fromARGB(255, 60, 73, 252))),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 30.0),
                                  child: Text(
                                    "Posts",
                                    style: TextStyle(
                                        fontFamily: "Poppins-Regular",
                                        fontWeight: FontWeight.w800,
                                        fontSize: 19,
                                        color:
                                            Color.fromARGB(255, 255, 255, 255)),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 35.0),
                                  child: Text(
                                    "(356)",
                                    style: TextStyle(
                                        fontFamily: "Poppins-Regular",
                                        fontWeight: FontWeight.w800,
                                        fontSize: 15,
                                        color:
                                            Color.fromARGB(255, 255, 255, 255)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Box 3 //

                        Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const CreateADs()));
                            },
                            child: Container(
                              height: 110,
                              width: 105,
                              decoration: BoxDecoration(
                                  color: Colors.purple,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: Icon(Icons.ads_click,
                                          color: Color.fromARGB(
                                              255, 60, 73, 252))),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 35.0),
                                    child: Text(
                                      "Ads",
                                      style: TextStyle(
                                          fontFamily: "Poppins-Regular",
                                          fontWeight: FontWeight.w800,
                                          fontSize: 19,
                                          color: Color.fromARGB(
                                              255, 255, 255, 255)),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 40.0),
                                    child: Text(
                                      "(0)",
                                      style: TextStyle(
                                          fontFamily: "Poppins-Regular",
                                          fontWeight: FontWeight.w800,
                                          fontSize: 15,
                                          color: Color.fromARGB(
                                              255, 255, 255, 255)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // OverView Stat //
            ],
          ),
        )));
  }
}
