import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../utils/auth.dart';
import '../auth/login_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xFFF8F3F0),
      child: ListView(
        children: [
          ListTile(
            title: Text("تسجيل الخروج"),
            leading: Icon(Icons.logout),
            onTap: () async {
              await signOut(context);
            },
          ),
          Divider(
            thickness: 2,
          ),
        ],
      ),
    );
    ;
  }
}
