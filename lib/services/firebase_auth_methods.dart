import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nbc_app/utils/show_SnackBar.dart';

class FirebaseAuthMethods {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseAuthMethods(this._auth);

  Future<void> signUpWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      // Call sendEmailVerification from within a widget context
      // ignore: use_build_context_synchronously
      await sendEmailVerification(context);
    } on FirebaseAuthException catch (e) {
      // ignore: use_build_context_synchronously
      showSnackBar(context, e.message!);
    }
  }

  //email log in
  Future<void> loginWithEmail({
    required String email,
    required String password,
    required BuildContext context,
    required Function onSuccess,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      if (_auth.currentUser != null && _auth.currentUser!.emailVerified) {
        onSuccess(); // Call the success callback
        await addUserToFirestore(
            _auth.currentUser!.uid, _auth.currentUser!.email!);
      } else {
        showSnackBar(context, 'Please verify your email address.');
      }
      if (!_auth.currentUser!.emailVerified) {
        await sendEmailVerification(context);
        // navigate to a modal or page to show that email is not verified blah blah
      }
    } on FirebaseAuthException catch (e) {
      // ignore: use_build_context_synchronously
      showSnackBar(context, e.message!);
    }
  }

  //email verification
  Future<void> sendEmailVerification(BuildContext context) async {
    try {
      await _auth.currentUser!.sendEmailVerification();
      showSnackBar(context, 'Email verification sent');
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  Future<void> addUserToFirestore(String uid, String email) async {
    try {
      await _firestore.collection('users').doc(uid).set({
        'email': email,
        'verified': true,
      });
    } catch (e) {
      // Handle any errors that may occur while adding the user to the collection.
      print('Error adding user to collection: $e');
    }
  }
}
