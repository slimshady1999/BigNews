import "package:flutter/material.dart";

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 60, 73, 252),
          title: const Text(
            "About Us",
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
          children: [
            Image.asset("images/logo/logo1.jpeg",
                height: 140, width: MediaQuery.of(context).size.width),
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                "Get alert instantly on football news and Highlights, follow your favourite football clubs, leagues and other competitions on BIG NEWS and get instant notifications about your favourite FC.",
                style: TextStyle(
                    fontFamily: "Poppins-Regular",
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                    color: Color.fromARGB(255, 65, 65, 65)),
              ),
            ),
          ],
        ));
  }
}
