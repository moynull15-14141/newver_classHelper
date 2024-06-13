import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<String> signUpUser(
      {required String email,
      required String password,
      required String id,
      required String name}) async {
    String res = " Some error Occurred";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          name.isNotEmpty ||
          id.isNotEmpty) {
        //for regestr user in firebase auth with email amd password

        UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        await _firestore.collection("user2").doc(credential.user!.uid).set(
          {
            'password': password,
            'name': name,
            'id': id,
            'email': email,
            'uid': credential.user!.uid,
          },
        );
        res = "success";
      }
      //for regestr user in firebase auth with email amd password
    } catch (e) {
      return e.toString();
    }
    return res;
  }

  //for login
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = " Some error Occurred";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "success";
      } else {
        res = "please enter all the fild";
      }
    } catch (e) {
      return e.toString();
    }
    return res;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
