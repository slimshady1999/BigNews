import 'dart:io';
import 'dart:math';

import 'package:bignews/admin_Area/pages/homepage/post_pages.dart';
import 'package:bignews/admin_Area/utilities/blogCrudOperation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import "package:flutter/material.dart";
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({super.key});

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _desController = TextEditingController();

  File? isSelectedImage;

  BlogCrud? blogCrud;

  // get image //

  Future getImage() async {
    final image =
        // ignore: invalid_use_of_visible_for_testing_member
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imageTemporary = File(image.path);
    setState(() {
      // ignore: unnecessary_this
      this.isSelectedImage = imageTemporary;
    });
  }

  // upload image to firebase storage //

  Future uploadImage() async {
    if (isSelectedImage != null) {
      final firebaseStorageRef = FirebaseStorage.instance
          .ref()
          .child("blogsImage")
          .child("${randomAlphaNumeric(9)}.jpg");

      firebaseStorageRef.putFile(isSelectedImage!);
      FirebaseStorage downloadUrl =
          await firebaseStorageRef.getDownloadURL() as FirebaseStorage;

      addUserData(_titleController.text, downloadUrl, _desController.text,
          DateTime.now());

      if (kDebugMode) {
        print(_titleController.text.trim());
      }
      if (kDebugMode) {
        print(_desController.text.trim());
      }

      // add data to firestore

      // Map<String, dynamic> blogMap = {
      //   "title": _titleController.text.trim(),
      //   "description": _desController.text.trim(),
      //   // "imageUrl": imageUrl,
      //   "createdAt": DateTime.now()
      // };

      // // adding to firestore //
      // blogCrud?.addData(blogMap).then((result) => Navigator.of(context).pop());

      Fluttertoast.showToast(msg: "upload successful $e");
      // ignore: use_build_context_synchronously
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const ActivityPage()));
    } else {
      Fluttertoast.showToast(msg: "Can't upload image $e");
    }
  }

  addUserData(
    String title,
    downloadUrl,
    createdAt,
    description,
  ) async {
    await FirebaseFirestore.instance.collection("usersData").add({
      "fullname": title,
      "email": description,
      "imageUrl": downloadUrl,
      "createdAt": createdAt
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 211, 211, 211),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 60, 73, 252),
        title: const Text(
          "Create a post",
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
          onPressed: () {
            uploadImage();
          },
          child: const Icon(Icons.send)),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 5.0, right: 0, left: 0),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              // image upload

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
                          onPressed: () {
                            getImage();
                          },
                          icon: const Icon(Icons.add)),
                    ),
                  ),
                ),
              ),

              // Image box view //
              const SizedBox(height: 8),
              isSelectedImage != null
                  ? Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width / 1.20,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 167, 167, 167),
                          borderRadius: BorderRadius.circular(5)),
                      child: Image.file(
                        isSelectedImage!,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Container(
                      height: 150,
                      width: 250,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 167, 167, 167),
                          borderRadius: BorderRadius.circular(5)),
                    ),

              // Title Text Field //

              Padding(
                padding: const EdgeInsets.only(left: 0),
                child: Container(
                  margin: const EdgeInsets.only(top: 3),
                  height: 80,
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: TextField(
                    controller: _titleController,
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
                  margin: const EdgeInsets.only(top: 0),
                  height: 170,
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: TextField(
                    maxLines: 20,
                    controller: _desController,
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
            ],
          ),
        ),
      ),
    );
  }
}
