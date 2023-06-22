import "package:flutter/material.dart";

class CreatePage extends StatelessWidget {
  const CreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 228, 228, 228),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 60, 73, 252),
        title: const Text(
          "Create a page",
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
      floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 60, 73, 252),
          onPressed: () {},
          child: const Icon(Icons.send)),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0, right: 0, left: 0),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              // Title Text Field //

              Padding(
                padding: const EdgeInsets.only(left: 0),
                child: Container(
                  margin: const EdgeInsets.only(top: 3),
                  height: 80,
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: TextField(
                    minLines: 1,
                    maxLines: 2,
                    decoration: InputDecoration(
                        hintText: ("title"),
                        hintStyle: const TextStyle(
                          fontFamily: "Poppins-Regular",
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                          color: Color.fromARGB(255, 77, 77, 77),
                        ),
                        border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 0),
                child: Container(
                  margin: const EdgeInsets.only(top: 8),
                  height: 170,
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: TextField(
                    maxLines: 30,
                    decoration: InputDecoration(
                        hintText: ("description"),
                        hintStyle: const TextStyle(
                          fontFamily: "Poppins-Regular",
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                          color: Color.fromARGB(255, 77, 77, 77),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Card(
                  child: ListTile(
                    leading: const Text(
                      "upload image",
                      style: TextStyle(
                          fontFamily: "Poppins-Regular",
                          fontWeight: FontWeight.w800,
                          fontSize: 17,
                          color: Color.fromARGB(255, 73, 73, 73)),
                    ),
                    trailing: CircleAvatar(
                      backgroundColor: const Color.fromARGB(255, 60, 73, 252),
                      child: IconButton(
                          onPressed: () {}, icon: const Icon(Icons.add)),
                    ),
                  ),
                ),
              ),

              // Image box view //
              const SizedBox(height: 8),
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 167, 167, 167),
                    borderRadius: BorderRadius.circular(5)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
