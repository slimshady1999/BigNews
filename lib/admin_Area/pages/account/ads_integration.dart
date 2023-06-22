import "package:flutter/material.dart";

class CreateADs extends StatelessWidget {
  const CreateADs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 60, 73, 252),
        title: const Text(
          "Create an Ad",
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Center(
            child: Text(
              "Coming Soon!",
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
