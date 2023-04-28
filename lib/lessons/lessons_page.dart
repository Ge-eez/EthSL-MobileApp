import 'package:flutter/material.dart';

import 'learn_lesson.dart';

class LessonsPage extends StatefulWidget {
  const LessonsPage({super.key});

  @override
  State<LessonsPage> createState() => _LessonsPageState();
}

class _LessonsPageState extends State<LessonsPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(120), // Set this height
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 50, 0, 0),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        RichText(
                          text: TextSpan(
                            style: DefaultTextStyle.of(context).style,
                            children: const <TextSpan>[
                              TextSpan(
                                text: "ሰላም ጄን\n",
                                style: TextStyle(
                                    color: Color.fromRGBO(51, 53, 123, 0.7),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: "ትምህርት ጀምሪ!",
                                style: TextStyle(
                                  color: Color.fromRGBO(51, 53, 123, 0.7),
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.fade,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: SizedBox(
            height: 500,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: const <TextSpan>[
                      TextSpan(
                        text: "ፊደሎች\n",
                        style: TextStyle(
                            color: Color.fromRGBO(51, 53, 123, 0.7),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    children: [
                      lessonCard(),
                      lessonCard(),
                      lessonCard(),
                      lessonCard(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class lessonCard extends StatelessWidget {
  const lessonCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LearnLessonPage()),
        );
      },
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Stack(
            children: [
              Positioned(
                child: Container(
                  height: 100,
                  width: 5,
                  color: Colors.transparent,
                ),
              ),
              Positioned(
                left: 5,
                child: Container(
                    height: 100,
                    width: 5,
                    color: Color.fromRGBO(51, 53, 123, 0.7)),
              ),
              const CircleAvatar(
                backgroundColor: Colors.transparent,
                maxRadius: 8,
                child: Text(
                  '',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              const Positioned(
                top: 40,
                child: CircleAvatar(
                  backgroundColor: Color.fromRGBO(51, 53, 123, 1),
                  maxRadius: 8,
                  child: Text(
                    '',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                    color: const Color.fromRGBO(
                        51, 53, 123, 0.7), // Set border color
                    width: 3.0), // Set border width
                borderRadius: const BorderRadius.all(
                    Radius.circular(10.0)), // Set rounded corner radius
              ),
              height: 80,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: RichText(
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: const <TextSpan>[
                        TextSpan(
                          text: "ፊደል ሀ-ሆ\n",
                          style: TextStyle(
                              color: Color.fromRGBO(51, 53, 123, 0.7),
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: "7 ምልክቶች",
                          style: TextStyle(
                              color: Color.fromRGBO(51, 53, 123, 0.7),
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
