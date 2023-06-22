import 'package:bignews/admin_Area/pages/account/change_password.dart';
import 'package:bignews/admin_Area/pages/account/edit_profile.dart';
import "package:flutter/material.dart";

import '../../../account_Reg_screen/loginPage.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 60, 73, 252),
        title: const Text(
          "Profile",
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
      body: Scaffold(
        body: Column(
          children: [
            Container(
              height: 110,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 60, 73, 252),
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(65))),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Joe Emmanuel",
                            style: TextStyle(
                                fontFamily: "Poppins-Regular",
                                fontWeight: FontWeight.w800,
                                fontSize: 19,
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                          Text(
                            "Admin",
                            style: TextStyle(
                                fontFamily: "Poppins-Regular",
                                fontWeight: FontWeight.w800,
                                fontSize: 19,
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                        ],
                      ),
                    ),
                    const CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 50,
                      backgroundImage: AssetImage("images/logo/logo2.jpg"),
                    ),
                  ]),
            ),

            // List of Actions //
            const SizedBox(height: 20),
            Card(
              child: ListTile(
                leading: const Text(
                  "Edit Profile",
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
                            builder: (context) => EditProfile()));
                      },
                      icon: const Icon(Icons.add)),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Card(
              child: ListTile(
                leading: const Text(
                  "Change Password",
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
                            builder: (context) => ChangePassword()));
                      },
                      icon: const Icon(Icons.add)),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(top: 58.0),
              child: Container(
                height: 40,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Material(
                  color: const Color.fromARGB(255, 60, 73, 252),
                  borderRadius: BorderRadius.circular(20),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                          (route) => false);
                    },
                    borderRadius: BorderRadius.circular(20),
                    child: const Center(
                      child: Text(
                        "Logout",
                        style: TextStyle(
                          fontFamily: "Poppins-Regular",
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
