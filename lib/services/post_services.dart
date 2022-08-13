import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:summer_cump_project_2022/models/post.dart';

class PostServices {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  addPost(Post post) async {
    await _firebaseFirestore.collection('posts').doc().set(post.toJson());
  }

  Stream<QuerySnapshot> fetchAllPosts() {
    return _firebaseFirestore.collection('posts').snapshots();
  }
}
