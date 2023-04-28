import 'package:flutter/material.dart';
import 'package:blink/pages.dart';

import '../homepage/widgets/avatar_widget.dart';

class LearnLessonPage extends StatefulWidget {
  const LearnLessonPage({super.key});

  @override
  State<LearnLessonPage> createState() => _LearnLessonPageState();
}

class _LearnLessonPageState extends State<LearnLessonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.close,
            size: 35,
            color: Color.fromRGBO(51, 53, 123, 1),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          "ፊደል ሀ-ሆ",
          style: TextStyle(
            color: Color.fromRGBO(51, 53, 123, 1),
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Container(color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 180, 0, 0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: GreetingAvatar(),
            ),
          ),
          Positioned(
            top: 10,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 45, 8, 8),
              child: SizedBox(
                height: 70,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: const <TextSpan>[
                        TextSpan(
                          text: "ሀ\n",
                          style: TextStyle(
                              color: Color.fromRGBO(51, 53, 123, 0.7),
                              fontSize: 65,
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
