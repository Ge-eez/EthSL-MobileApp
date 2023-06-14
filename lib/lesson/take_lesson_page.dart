import 'package:blink/lesson/lesson_avatar.dart';
import 'package:blink/models/challenges_model.dart';
import 'package:blink/models/lessons_model.dart';
import 'package:flutter/material.dart';
import 'package:blink/pages.dart';

import '../homepage/widgets/avatar_widget.dart';

class TakeLessonPage extends StatefulWidget {
  LessonModel currentChallenge;
  TakeLessonPage({required this.currentChallenge, super.key});

  @override
  State<TakeLessonPage> createState() => _TakeLessonPageState();
}

class _TakeLessonPageState extends State<TakeLessonPage> {
  final myController = TextEditingController();
  List _characters = [];
  String _currAnimation = '[]';
  int _currIndex = 0;
  bool _finished = false;

  void progress() {
    if (_currIndex + 1 <= _characters.length - 1) {
      setState(() {
        _currIndex += 1;
        _currAnimation = '["${_characters[_currIndex]}"]';
      });
    } else {
      setState(() {
        _finished = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_characters.length == 0) {
      widget.currentChallenge.symbols.forEach((element) {
        _characters.add(element["representation"]);
      });
    }

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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: IconButton(
              icon: Icon(
                Icons.skip_next,
                size: 45,
                color: Color.fromRGBO(51, 53, 123, 1),
              ),
              onPressed: () => progress(),
            ),
          ),
        ],
        title: Text(
          '${widget.currentChallenge.symbols[0]["representation"]} - ${widget.currentChallenge.symbols[widget.currentChallenge.symbols.length - 1]["representation"]}',
          style: const TextStyle(
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
              child: LessonAvatar(
                lis: _currAnimation,
                key: UniqueKey(),
              ),
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
                  child: Text(
                    '${_characters[_currIndex]}',
                    style: const TextStyle(
                        color: Color.fromRGBO(51, 53, 123, 1), fontSize: 55),
                  ),
                ),
              ),
            ),
          ),
          Visibility(
            visible: _finished,
            child: Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                    ),
                    Icon(
                      Icons.check,
                      color: Colors.green,
                      size: 65,
                    ),
                    Text(
                      'Lesson Done!',
                      style: const TextStyle(
                          color: Color.fromRGBO(51, 53, 123, 1), fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
