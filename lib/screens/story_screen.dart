import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class StoryScreen extends StatefulWidget {
  const StoryScreen({Key key}) : super(key: key);

  @override
  _StoryScreenState createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  bool letter = false;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF8F3F0),
        foregroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "القصة",
            ),
          ],
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assest/p4.png"), fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Expanded(
              // width: double.infinity,
              // height: 145,
              child: AnimatedTextKit(
                isRepeatingAnimation: false,
                onFinished: showLetter,
                animatedTexts: [
                  TyperAnimatedText(
                    'أهلا يا صديقي ، كان هناك حديقة و بها أربع حيوانات القرد والفيل والأرنب والعصفور',
                    // speed: Duration(milliseconds: 180),
                    speed: Duration(milliseconds: 25),
                    textAlign: TextAlign.end,
                    textStyle: const TextStyle(
                      fontSize: 30,
                      color: Color.fromARGB(255, 5, 57, 99),
                    ),
                  ),
                ],
                onTap: () {
                  print("I am executing");
                },
              ),
            ),
            if (letter)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent)),
                    child: Text(
                      "أ",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 40,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            Row(
              children: <Widget>[
                Image(
                  image: AssetImage('assest/hap.png'),
                  height: 300,
                  width: 270,
                )
              ],
            ),
          ],
        ),
      ), //body
    );
  }

  void showLetter() {
    setState(() {
      letter = true;
    });
  }
}
