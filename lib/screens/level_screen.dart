import 'package:flutter/material.dart';

import '../models/user_model.dart';
import '../utils/auth.dart';
import 'story_screen.dart';

class LevelScreen extends StatefulWidget {
  const LevelScreen({Key key}) : super(key: key);

  @override
  _LevelScreenState createState() => _LevelScreenState();
}

class _LevelScreenState extends State<LevelScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserModel>(
        future: getCurrentUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(child: CircularProgressIndicator());
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.data == null) {
            signOut(context);
            return Center(
              child: Text("حدث خطأ ما"),
            );
          }
          final user = snapshot.data;

          return Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xFFF8F3F0),
              foregroundColor: Colors.black,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    user.firstname,
                    style: TextStyle(fontSize: 21, color: Colors.black),
                  ),
                  Container(
                    margin:
                        EdgeInsets.only(right: 5, left: 0, top: 5, bottom: 5),
                    width: 50,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Color(0xFFF8F3F0),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: FittedBox(
                      child: Image.asset('assest/Char2.png'),
                    ),
                  ),
                ],
              ),
            ),

            body: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assest/p4.png"), fit: BoxFit.cover)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //level one
                    Container(
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.all(5),
                      child: Material(
                        color: Color(0xFFF8F3F0),
                        borderRadius: BorderRadius.circular(28),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: InkWell(
                          splashColor: Colors.black26,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => StoryScreen()));
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Ink.image(
                                  image: AssetImage('assest/level1.png'),
                                  height: 80,
                                  width: 120,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              SizedBox(height: 3),
                              Text(
                                'التحدي الاول',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black),
                              ),
                              SizedBox(height: 3),
                            ],
                          ),
                        ),
                      ),
                    ),

                    //level 2
                    Container(
                      padding: EdgeInsets.all(
                          20), //You can use EdgeInsets like above
                      margin: EdgeInsets.all(5),
                      child: Material(
                        color: Color(0xFFF8F3F0),
                        borderRadius: BorderRadius.circular(28),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: InkWell(
                          splashColor: Colors.black26,

                          //كود ثاني اللي يودي للصفحه اللي بعدها
                          //onPressed: () {},

                          //هنا يروح للصفحه الثانيه
                          onTap: () {},
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Ink.image(
                                  image: AssetImage('assest/level2.png'),
                                  height: 80,
                                  width: 110,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'التحدي الثاني',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black),
                              ),
                              SizedBox(height: 3),
                            ],
                          ),
                        ),
                      ),
                    ),

                    Icon(
                      Icons.lock,
                      color: Color(0xe6363636),
                      size: 20.0,
                    ),

                    //level3
                    Container(
                      padding: EdgeInsets.all(
                          20), //You can use EdgeInsets like above
                      margin: EdgeInsets.all(5),
                      child: Material(
                        color: Color(0xFFF8F3F0),
                        borderRadius: BorderRadius.circular(28),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: InkWell(
                          splashColor: Colors.black26,

                          //كود ثاني اللي يودي للصفحه اللي بعدها
                          //onPressed: () {},

                          //هنا يروح للصفحه الثانيه
                          onTap: () {},
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Ink.image(
                                  image: AssetImage('assest/level3.png'),
                                  height: 80,
                                  width: 110,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              SizedBox(height: 3),
                              Text(
                                'التحدي الثالث',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black),
                              ),
                              SizedBox(height: 3),
                            ],
                          ),
                        ),
                      ),
                    ),

                    Icon(
                      Icons.lock,
                      color: Color(0xe6363636),
                      size: 20.0,
                    ),
                  ] // children
                  ),
            ), //body
          );
        });
  }
}
