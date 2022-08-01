import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:summer_cump_project_2022/models/end_user.dart';

class AuthServices {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  EndUser _userfirebaseUser(User? firebaseUser) {
    return EndUser(uid: firebaseUser!.uid);
  }

  Future registerUser(EndUser newUser, String password) async {
    try {
      UserCredential endUserCredentials =
          await _firebaseAuth.createUserWithEmailAndPassword(
              email: newUser.email!, password: password);
      User firebaseUser = endUserCredentials.user!;
      addUserToCollection(newUser, firebaseUser.uid);
      return _userfirebaseUser(firebaseUser);
    } catch (err, stacktrace) {
      log('user signup failed :: $err');
      log('user signup failed :: $stacktrace');
      return null;
    }
  }

  //
  Future loginUser(String email, String password) async {
    UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    User? user = result.user;
    return user!.uid;
  }

//
  Future logout() async {
    await FirebaseAuth.instance.signOut();
  }

  Future addUserToCollection(EndUser newUser, String? uid) async {
    await _firebaseFirestore.collection('users').doc(uid).set(newUser.toJson());
  }
}
