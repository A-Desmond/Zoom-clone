import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:zoom/utils/snack_bar.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Stream<User?> get authState => _auth.authStateChanges();

  Future<bool> singInWithGoogle(BuildContext context) async {
    var res = false;
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleSignInAuthentication =
          await googleSignInAccount?.authentication;
      final credentials = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication!.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      UserCredential credential = await _auth.signInWithCredential(credentials);
      User? user = credential.user;
      if (user != null) {
        if (credential.additionalUserInfo!.isNewUser) {
          await _firestore.collection('users').doc(user.uid).set({
            'username': user.displayName,
            'uid': user.uid,
            'profilePhoto': user.photoURL,
          });
        }
      }
      res = true;
    } on FirebaseAuthException catch (e) {
      showSnackBar(context: context, message: e.message.toString());
      res = true;
    }
    return res;

    ///37 mins
  }
}
