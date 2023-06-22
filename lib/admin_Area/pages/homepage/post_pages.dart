import "package:flutter/material.dart";

class ActivityPage extends StatelessWidget {
  const ActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 100, 100, 100),
        ),
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
