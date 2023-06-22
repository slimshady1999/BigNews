import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class BlogCrud {
  Future<void> addData(blogData) async {
    FirebaseFirestore.instance
        .collection("blogPosts")
        .add(blogData)
        .catchError((e) {
      if (kDebugMode) {
        print(e);
      }
    });
  }
}
