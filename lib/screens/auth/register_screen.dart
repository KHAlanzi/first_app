import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/models/user_model.dart';
import 'package:first_app/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../utils/auth.dart';
import '../level_screen.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  //form key
  final _formKey = GlobalKey<FormState>();

  String firstName;
  String age;
  String email;
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assest/p4.png"), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 30),
          child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 180, //image
                      child: Image.asset(
                        "assest/Logo-purple.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: 15),
                    Column(
                      children: [
                        TextFormField(
                          autofocus: false,
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            RegExp regExp = new RegExp(r'^.{3,}$');
                            if (value.isEmpty) {
                              return ('???????????? ?????????? ??????????');
                            }
                            if (!regExp.hasMatch(value)) {
                              return ("?????????? ?????? ????????(???????? ???????? ?????? ??????????)");
                            }
                            return null;
                          },
                          onSaved: (value) {
                            firstName = value;
                          },
                          textInputAction: TextInputAction.next,
                          textDirection: TextDirection.rtl,
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.account_circle),
                            contentPadding: EdgeInsets.fromLTRB(2, 2, 2, 2),
                            hintText: "??????????",
                            hintTextDirection: TextDirection.rtl,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          autofocus: false,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "???????????? ?????????? ??????????";
                            }
                            final toInt = int.tryParse(value);
                            if (toInt < 2 || toInt > 8) {
                              return "?????????? ?????? ????????";
                            }
                            return null;
                          },
                          onSaved: (value) {
                            age = value;
                          },
                          textInputAction: TextInputAction.next,
                          textDirection: TextDirection.rtl,
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.date_range_sharp),
                            contentPadding: EdgeInsets.fromLTRB(2, 2, 2, 2),
                            hintText: "??????????",
                            hintTextDirection: TextDirection.rtl,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          autofocus: false,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value.isEmpty) {
                              return ("???????????? ?????????? ???????????? ???????????????????? ");
                            }
                            //expression for email valid
                            if (!RegExp(
                                    "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                .hasMatch(value)) {
                              return ("???????????? ???????????????????? ?????? ????????");
                            }
                            return null;
                          },
                          onSaved: (value) {
                            email = value;
                          },
                          textInputAction: TextInputAction.next,
                          textDirection: TextDirection.rtl,
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.mail),
                            contentPadding: EdgeInsets.fromLTRB(2, 2, 2, 2),
                            hintText: "???????????? ????????????????????",
                            hintTextDirection: TextDirection.rtl,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          autofocus: false,
                          obscureText: true,
                          controller: passwordController,
                          validator: (value) {
                            RegExp regExp = new RegExp(r'^.{6,}$');
                            if (value.isEmpty) {
                              return ('???????????? ?????????? ???????? ????????????');
                            }
                            if (!regExp.hasMatch(value)) {
                              return ("???????? ???????????? ?????? ??????????(?????? ???????? ???? ?????????? ?????? ??????????)");
                            }
                            return null;
                          },
                          onSaved: (value) {
                            passwordController.text = value;
                          },
                          textInputAction: TextInputAction.next,
                          textDirection: TextDirection.rtl,
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.vpn_key),
                            contentPadding: EdgeInsets.fromLTRB(2, 2, 2, 2),
                            hintText: "???????? ????????????",
                            hintTextDirection: TextDirection.rtl,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          autofocus: false,
                          obscureText: true,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "???????????? ?????????? ???????? ????????????";
                            }

                            if (value != passwordController.text) {
                              return "???????? ???????????? ?????? ??????????????";
                            }
                            return null;
                          },
                          textInputAction: TextInputAction.done,
                          textDirection: TextDirection.rtl,
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.vpn_key),
                            contentPadding: EdgeInsets.fromLTRB(2, 2, 2, 2),
                            hintText: "?????????? ???????? ????????????",
                            hintTextDirection: TextDirection.rtl,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.blue,
                          child: MaterialButton(
                              padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                              minWidth: MediaQuery.of(context).size.width,
                              onPressed: () async {
                                // Check if the form is valid
                                if (_formKey.currentState.validate() == false)
                                  return;
                                _formKey.currentState.save();

                                // Check if the account is created
                                bool accountCreated = await signUp(email,
                                    passwordController.text, firstName, age);
                                if (accountCreated == true) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MainScreen()));
                                }
                              },
                              child: Text(
                                "?????????? ???????? ???????? ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                        SizedBox(height: 10),
                        Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.blue,
                          child: MaterialButton(
                              padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                              minWidth: MediaQuery.of(context).size.width,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            LoginScreen())); //call the other page
                              },
                              child: Text(
                                "?????????? ????????????",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
