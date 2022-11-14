import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../models/user_model.dart';
import '../screens/auth/login_screen.dart';

Future<bool> signIn(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((uid) => {
              Fluttertoast.showToast(msg: "تم تسجيل الدخول"),
            });
    return true;
  } catch (error) {
    Fluttertoast.showToast(msg: error.message);
    return false;
  }
}

Future<bool> signUp(
    String email, String password, String firstName, String age) async {
  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    return postDetailsToFirestore(age, firstName);
  } catch (error) {
    Fluttertoast.showToast(msg: error.message);
    return false;
  }
}

Future<bool> postDetailsToFirestore(String age, String firstName) async {
  try {
    //call firestore
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User user = FirebaseAuth.instance.currentUser;

    //call user moudel
    UserModel userModel = UserModel(
        uid: user.uid, email: user.email, firstname: firstName, age: age);

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "تم انشاء الحساب بنجاح");
    return true;
  } catch (error) {
    Fluttertoast.showToast(msg: error.message);
    return false;
  }
}

Future<UserModel> getCurrentUser() async {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  User user = FirebaseAuth.instance.currentUser;

  final data = await firebaseFirestore.collection("users").doc(user.uid).get();
  if (data == null) return null;
  final currentUser = UserModel.fromMap(data);

  return currentUser;
}

Future<void> signOut(context) async {
  await FirebaseAuth.instance.signOut();
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => LoginScreen()));
}
