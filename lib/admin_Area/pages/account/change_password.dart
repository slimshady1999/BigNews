import 'package:bignews/admin_Area/pages/account/profile_Page.dart';
import "package:flutter/material.dart";

class ChangePassword extends StatelessWidget {
  ChangePassword({super.key});

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 60, 73, 252),
        title: const Text(
          "Change Password",
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
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: SizedBox(
                height: 45,
                width: MediaQuery.of(context).size.width / 1.1,
                child: TextFormField(
                  controller: _passwordController,
                  validator: (password) {
                    // ignore: unrelated_type_equality_checks
                    if (password != 6) {
                      return null;
                    } else {
                      const Text("password must be 6 characters long");
                    }
                  },
                  decoration: const InputDecoration(
                      hintText: "New Password", border: UnderlineInputBorder()),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: SizedBox(
                height: 45,
                width: MediaQuery.of(context).size.width / 1.1,
                child: TextFormField(
                  controller: _passwordController,
                  validator: (password) {
                    // ignore: unrelated_type_equality_checks
                    if (password != 6) {
                      return null;
                    } else {
                      const Text("password must be 6 characters long");
                    }
                  },
                  decoration: const InputDecoration(
                      hintText: "Comfirm Password",
                      border: UnderlineInputBorder()),
                ),
              ),
            ),
            const SizedBox(height: 30),
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
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const MyProfile()),
                        (route) => false);
                  },
                  borderRadius: BorderRadius.circular(20),
                  child: const Center(
                    child: Text(
                      "Update",
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
          ],
        ),
      ),
    );
  }
}
