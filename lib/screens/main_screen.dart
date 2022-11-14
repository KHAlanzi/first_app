import 'package:first_app/models/user_model.dart';
import 'package:first_app/screens/report_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/auth.dart';
import 'level_screen.dart';
import 'widgets/custom_drawer.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(),
      backgroundColor: Color(0xFFF8F3F0),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assest/p4.png"), fit: BoxFit.cover)),
          //size: Size,
          child: FutureBuilder<UserModel>(
            future: getCurrentUser(),
            builder: ((context, snapshot) {
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
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () => _scaffoldKey.currentState.openDrawer(),
                    icon: Icon(Icons.menu),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Image.asset('assest/Char2.png', width: 180),
                          const SizedBox(height: 1),
                          Text.rich(
                            TextSpan(
                              text: 'مرحبا ،',
                              style: GoogleFonts.scheherazadeNew(fontSize: 32),
                              children: [
                                TextSpan(
                                  text: user.firstname,
                                  style: GoogleFonts.scheherazadeNew(
                                    fontSize: 32,
                                    color: const Color(0XFFB78233),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 15),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LevelScreen(),
                                ),
                              );
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * .9,
                              height: 200,
                              decoration: BoxDecoration(
                                  image: const DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage('assest/animals.png'),
                                      alignment: Alignment.topCenter),
                                  borderRadius: BorderRadius.circular(15),
                                  color: const Color(0xFFFEF1ED),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.08),
                                        blurRadius: 10)
                                  ]),
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: Text(
                                    'إبدأ التحدي',
                                    style: GoogleFonts.scheherazadeNew(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ReportScreen(),
                                    ),
                                  );
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width * .4,
                                  height: 190,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: const Color(0xFFCEE5F5),
                                      boxShadow: [
                                        BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.08),
                                            blurRadius: 10)
                                      ]),
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 10.0),
                                      child: Text(
                                        'نتائجك',
                                        style: GoogleFonts.scheherazadeNew(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  // log('YOU CLIECKED ME 6');
                                  // navigate(title: 'From pink');
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width * .4,
                                  height: 190,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: const Color(0xFFFBEAE6),
                                      //TODO add image here
                                      //image: ,
                                      boxShadow: [
                                        BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.08),
                                            blurRadius: 10)
                                      ]),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
