import 'package:bignews/account_Reg_screen/loginPage.dart';
import 'package:bignews/admin_Area/pages/homepage/about_page.dart';
import 'package:bignews/admin_Area/pages/homepage/create_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import "package:flutter/material.dart";

import '../../utilities/model/userProfileDataModel.dart';
import '../account/profile_Page.dart';
import 'ads_integration.dart';
import 'create_post.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({
    super.key,
  });

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  // Listen to sign in status //

  String? isSignedIn;

  final auth = FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      if (kDebugMode) {
        print('User is currently signed out!');
      }
    } else {
      if (kDebugMode) {
        print('User is signed in!');
      }
    }
  });

  @override
  void initState() {
    //  getUserProfileData();

    super.initState();
  }

  final currentUser = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color.fromARGB(255, 206, 205, 205),
        child: Column(
          children: [
            // Account Section //
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 60, 73, 252),
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(65))),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 40,
                            backgroundImage:
                                AssetImage("images/logo/logo2.jpg"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Container(
                            height: 100,
                            width: 190,
                            child: StreamBuilder(
                                stream: FirebaseFirestore.instance
                                    .collection("usersData")
                                    .where("uid",
                                        isEqualTo: currentUser.currentUser!.uid)
                                    .snapshots(),
                                builder: (context,
                                    AsyncSnapshot<QuerySnapshot> snapshot) {
                                  if (snapshot.hasData) {
                                    return ListView.builder(
                                        itemCount: snapshot.data!.docs.length,
                                        itemBuilder: (context, index) {
                                          return Column(children: [
                                            Text(
                                              "${snapshot.data!.docs[index]["fullname"]}",
                                              style: const TextStyle(
                                                fontFamily: "Poppins-Regular",
                                                fontWeight: FontWeight.w700,
                                                fontSize: 19,
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              height: 40,
                                              width: 120,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Material(
                                                color: const Color.fromARGB(
                                                    255, 255, 255, 255),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                child: InkWell(
                                                  onTap: () {
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                const MyProfile()));
                                                  },
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  child: const Center(
                                                    child: Text(
                                                      "View Profile",
                                                      style: TextStyle(
                                                        fontFamily:
                                                            "Poppins-Regular",
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 15,
                                                        color: Color.fromARGB(
                                                            255, 60, 73, 252),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ]);
                                        });
                                  } else {
                                    return const Text("Loading");
                                  }
                                }),
                          ),
                        ),
                      ],
                    ),
                  ]),
            ),
            // Account Section //

            // List of Actions //
            const SizedBox(height: 20),
            Card(
              child: ListTile(
                leading: const Text(
                  "Create a post",
                  style: TextStyle(
                      fontFamily: "Poppins-Regular",
                      fontWeight: FontWeight.w800,
                      fontSize: 17,
                      color: Color.fromARGB(255, 73, 73, 73)),
                ),
                trailing: CircleAvatar(
                  backgroundColor: const Color.fromARGB(255, 60, 73, 252),
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const CreatePost()));
                      },
                      icon: const Icon(Icons.add)),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Card(
              child: ListTile(
                leading: const Text(
                  "Create a page",
                  style: TextStyle(
                      fontFamily: "Poppins-Regular",
                      fontWeight: FontWeight.w800,
                      fontSize: 17,
                      color: Color.fromARGB(255, 73, 73, 73)),
                ),
                trailing: CircleAvatar(
                  backgroundColor: const Color.fromARGB(255, 60, 73, 252),
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const CreatePage()));
                      },
                      icon: const Icon(Icons.add)),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Card(
              child: ListTile(
                leading: const Text(
                  "Create ads",
                  style: TextStyle(
                      fontFamily: "Poppins-Regular",
                      fontWeight: FontWeight.w800,
                      fontSize: 17,
                      color: Color.fromARGB(255, 73, 73, 73)),
                ),
                trailing: CircleAvatar(
                  backgroundColor: const Color.fromARGB(255, 60, 73, 252),
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const CreateADs()));
                      },
                      icon: const Icon(Icons.add)),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Card(
              child: ListTile(
                leading: const Text(
                  "About Us",
                  style: TextStyle(
                      fontFamily: "Poppins-Regular",
                      fontWeight: FontWeight.w800,
                      fontSize: 17,
                      color: Color.fromARGB(255, 73, 73, 73)),
                ),
                trailing: CircleAvatar(
                  backgroundColor: const Color.fromARGB(255, 60, 73, 252),
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const AboutPage()));
                      },
                      icon: const Icon(Icons.arrow_forward_ios)),
                ),
              ),
            ),

            // Logout Button //

            Padding(
              padding: const EdgeInsets.only(top: 58.0),
              child: Container(
                height: 40,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Material(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(20),
                  child: InkWell(
                    onTap: () {
                      FirebaseAuth.instance.signOut().then((value) =>
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()),
                              (route) => false));
                    },
                    borderRadius: BorderRadius.circular(20),
                    child: const Center(
                      child: Text(
                        "Logout",
                        style: TextStyle(
                          fontFamily: "Poppins-Regular",
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                          color: Color.fromARGB(255, 60, 73, 252),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

//

/*
Text(currentUser!.email.toString()),
                              const Text(
                                "Joe Emmanuel",
                                style: TextStyle(
                                    fontFamily: "Poppins-Regular",
                                    fontWeight: FontWeight.w800,
                                    fontSize: 19,
                                    color: Color.fromARGB(255, 255, 255, 255)),
                              ),
                              const SizedBox(height: 20),
                              Container(
                                height: 40,
                                width: 120,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Material(
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  borderRadius: BorderRadius.circular(20),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const MyProfile()));
                                    },
                                    borderRadius: BorderRadius.circular(20),
                                    child: const Center(
                                      child: Text(
                                        "View Profile",
                                        style: TextStyle(
                                          fontFamily: "Poppins-Regular",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 15,
                                          color:
                                              Color.fromARGB(255, 60, 73, 252),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              */
