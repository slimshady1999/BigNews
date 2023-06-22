import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import "package:flutter/material.dart";

class UsersList extends StatelessWidget {
  const UsersList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 226, 226, 226),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 60, 73, 252),
        title: const Text(
          "List of Users",
          style: TextStyle(
              fontFamily: "Poppins-Regular",
              fontWeight: FontWeight.w800,
              fontSize: 20,
              color: Color.fromARGB(255, 255, 255, 255)),
        ),
        centerTitle: true,
        elevation: 0,
        iconTheme:
            const IconThemeData(color: Color.fromARGB(255, 253, 253, 253)),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: StreamBuilder(
          stream:
              FirebaseFirestore.instance.collection("usersData").snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: ListTile(
                          title: Text(
                            "Fullname: ${snapshot.data!.docs[index]["fullname"]}",
                            style: const TextStyle(
                              fontFamily: "Poppins-Regular",
                              fontWeight: FontWeight.w700,
                              fontSize: 19,
                              color: Color.fromARGB(255, 53, 53, 53),
                            ),
                          ),
                          subtitle: Text(
                            "Email: ${snapshot.data!.docs[index]["email"]}",
                            style: const TextStyle(
                              fontFamily: "Poppins-Regular",
                              fontWeight: FontWeight.w700,
                              fontSize: 19,
                              color: Color.fromARGB(255, 53, 53, 53),
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return const Text("Loading users");
          },
        ),
      ),
    );
  }
}
