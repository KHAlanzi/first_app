import 'package:first_app/models/user_model.dart';
import 'package:first_app/utils/auth.dart';
import 'package:flutter/material.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({Key key}) : super(key: key);

  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
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
              resizeToAvoidBottomInset: false,
              backgroundColor: Color(0xFFF8F3F0),
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
                  height: 670,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Colors.white,
                  ),
                  margin:
                      EdgeInsets.only(left: 20, top: 30, right: 20, bottom: 50),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 110, top: 40, right: 110, bottom: 200),
                          child: Image.asset('assest/trophy.png'),
                        ),
                      ),
                      Container(
                          child: Column(
                        children: <Widget>[
                          Row(children: <Widget>[
                            Container(
                              child: Text(
                                'أحسنـت',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 219, 166, 60),
                                  fontSize: 26,
                                ),
                              ),
                              margin: EdgeInsets.only(left: 140, top: 190),
                            ),
                          ]),
                          Container(
                              child: Column(children: <Widget>[
                            Row(children: <Widget>[
                              Container(
                                child: Text(
                                  'لقد تمكنت من نطق هذه الحروف',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
                                margin: EdgeInsets.only(left: 100, top: 20),
                              ),
                            ]),
                            Container(
                                padding: EdgeInsets.symmetric(vertical: 20),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Row(children: <Widget>[
                                        Container(
                                          height: 50,
                                          width: 45,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            border: Border.all(
                                              width: 4,
                                              color: Colors.green,
                                            ),
                                            color: Colors.white,
                                          ),
                                          margin: EdgeInsets.only(left: 22),
                                          child: Text(
                                            '',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 26,
                                            ),
                                          ),
                                          padding: EdgeInsets.only(left: 12),
                                        ),
                                        Container(
                                          height: 50,
                                          width: 45,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            border: Border.all(
                                              width: 4,
                                              color: Colors.green,
                                            ),
                                            color: Colors.white,
                                          ),
                                          margin: EdgeInsets.only(left: 15),
                                          child: Text(
                                            '',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 26,
                                            ),
                                          ),
                                          padding: EdgeInsets.only(left: 12),
                                        ),
                                        Container(
                                          height: 50,
                                          width: 45,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            border: Border.all(
                                              width: 4,
                                              color: Colors.green,
                                            ),
                                            color: Colors.white,
                                          ),
                                          margin: EdgeInsets.only(left: 15),
                                          child: Text(
                                            '',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 26,
                                            ),
                                          ),
                                          padding: EdgeInsets.only(left: 15),
                                        ),
                                        Container(
                                          height: 50,
                                          width: 45,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            border: Border.all(
                                              width: 4,
                                              color: Colors.green,
                                            ),
                                            color: Colors.white,
                                          ),
                                          margin: EdgeInsets.only(left: 15),
                                          child: Text(
                                            '',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 26,
                                            ),
                                          ),
                                          padding: EdgeInsets.only(left: 10),
                                        ),
                                        Container(
                                          height: 50,
                                          width: 45,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            border: Border.all(
                                              width: 4,
                                              color: Colors.green,
                                            ),
                                            color: Colors.white,
                                          ),
                                          margin: EdgeInsets.only(left: 15),
                                          child: Text(
                                            '',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 26,
                                            ),
                                          ),
                                          padding: EdgeInsets.only(left: 13),
                                        ),
                                      ]),
                                      Container(
                                        child: Column(
                                          children: <Widget>[
                                            Row(children: <Widget>[
                                              Container(
                                                child: Text(
                                                  'لقد واجهت صعوبة في نطق هذه الحروف',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                                margin: EdgeInsets.only(
                                                    left: 50, top: 30),
                                              ),
                                            ]),
                                            Container(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 20),
                                                child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Row(children: <Widget>[
                                                        Container(
                                                          height: 50,
                                                          width: 40,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10)),
                                                            border: Border.all(
                                                              width: 4,
                                                              color: Color(
                                                                  0xFFBD3232),
                                                            ),
                                                            color: Colors.white,
                                                          ),
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 150),
                                                          child: Text(
                                                            '',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 26,
                                                            ),
                                                          ),
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 13),
                                                        ),
                                                        Container(
                                                          height: 50,
                                                          width: 40,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10)),
                                                            border: Border.all(
                                                              width: 4,
                                                              color: Color(
                                                                  0xFFBD3232),
                                                            ),
                                                            color: Colors.white,
                                                          ),
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 15),
                                                          child: Text(
                                                            '',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 26,
                                                            ),
                                                          ),
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 13),
                                                        ),
                                                        Container(
                                                          height: 50,
                                                          width: 40,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10)),
                                                            border: Border.all(
                                                              width: 4,
                                                              color: Color(
                                                                  0xFFBD3232),
                                                            ),
                                                            color: Colors.white,
                                                          ),
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 15),
                                                          child: Text(
                                                            '',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 26,
                                                            ),
                                                          ),
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 13),
                                                        ),
                                                      ]),
                                                    ])),
                                          ],
                                        ),
                                      ),
                                    ])),
                          ])),
                        ],
                      ))
                    ],
                  )));
        });
  }
}
