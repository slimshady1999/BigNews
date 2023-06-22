import 'package:bignews/admin_Area/pages/account/profile_Page.dart';
import "package:flutter/material.dart";

class EditProfile extends StatelessWidget {
  EditProfile({super.key});

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 60, 73, 252),
        title: const Text(
          "Edit Profile",
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
        padding: const EdgeInsets.only(top: 30.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 60, 73, 252),
                  radius: 50,
                  child: Icon(Icons.person, size: 90, color: Colors.white),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add,
                      size: 40,
                      color: Color.fromARGB(255, 60, 73, 252),
                    )),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: SizedBox(
                height: 45,
                width: MediaQuery.of(context).size.width / 1.1,
                child: TextFormField(
                  controller: _fullNameController,
                  decoration: const InputDecoration(
                      hintText: "Fullname", border: UnderlineInputBorder()),
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
                  controller: _emailController,
                  validator: (email) {
                    if (email != null && email.contains("@gmail")) {
                      return null;
                    } else {
                      const Text("email not valid");
                    }
                  },
                  decoration: const InputDecoration(
                      hintText: "Email", border: UnderlineInputBorder()),
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
