import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:first_app/screens/main_screen.dart';
import 'package:flutter/material.dart';

import 'screens/auth/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'p-champ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: user == null ? LoginScreen() : MainScreen(),
    );
  }
}
