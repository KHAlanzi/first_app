import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../utils/auth.dart';
import '../main_screen.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //form key
  final _formKey = GlobalKey<FormState>();

  String password;
  String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assest/p4.png"), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.all(36.0),
          child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                        height: 300,
                        child: Image.asset(
                          "assest/Logo-purple.png",
                          fit: BoxFit.contain,
                        )),
                    SizedBox(height: 45),
                    TextFormField(
                      autofocus: false,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value.isEmpty) {
                          return ("الرجاء ادخال البريد الالكتروني ");
                        }
                        //expression for email valid
                        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                            .hasMatch(value)) {
                          return ("البريد الالكتروني غير صحيح");
                        }
                        return null;
                      },
                      onSaved: (value) {
                        email = value;
                      },
                      textInputAction: TextInputAction.next,
                      textDirection: TextDirection.rtl,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.mail),
                          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                          hintText: "البريد الالكتروني",
                          hintTextDirection: TextDirection.rtl,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    ),
                    SizedBox(height: 25),
                    TextFormField(
                        autofocus: false,
                        obscureText: true,
                        validator: (value) {
                          RegExp regExp = new RegExp(r'^.{6,}$');
                          if (value.isEmpty) {
                            return ('الرجاء ادخال كلمة المرور');
                          }
                          if (!regExp.hasMatch(value)) {
                            return ("كلمة المرور غير صحيحة(سته حروف او ارقام على الاقل)");
                          }

                          return null;
                        },
                        onSaved: (value) {
                          password = value;
                        },
                        textInputAction: TextInputAction.done,
                        textDirection: TextDirection.rtl,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.vpn_key),
                          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                          hintText: " كلمة المرور",
                          hintTextDirection: TextDirection.rtl,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        )),
                    SizedBox(height: 35),
                    Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.blue,
                      child: MaterialButton(
                          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                          minWidth: MediaQuery.of(context).size.width,
                          onPressed: () async {
                            if (_formKey.currentState.validate() == false)
                              return;
                            _formKey.currentState.save();
                            bool corraccount = await signIn(email, password);
                            if (corraccount == true)
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => MainScreen()));
                          },
                          child: Text(
                            "تسجيل الدخول",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    SizedBox(height: 15),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          RegisterScreen())); //call the other page
                            },
                            child: Text(
                              "انشاء حساب جديد ؟",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          )
                        ])
                  ],
                ),
              )),
        ),
      ),
    );

    // ),
    //),
    // );
  }
}
