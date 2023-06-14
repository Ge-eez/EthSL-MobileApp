import 'package:blink/models/challenges_model.dart';
import 'package:flutter/material.dart';
import 'package:blink/pages.dart';

import '../homepage/widgets/avatar_widget.dart';

class TakeChallengePage extends StatefulWidget {
  ChallengeModel currentChallenge;
  TakeChallengePage({required this.currentChallenge, super.key});

  @override
  State<TakeChallengePage> createState() => _TakeChallengePageState();
}

class _TakeChallengePageState extends State<TakeChallengePage> {
  final myController = TextEditingController();
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
                child: Padding(
                  padding: EdgeInsets.fromLTRB(100, 0, 100, 0),
                  child: TextField(
                    controller: myController,
                    onSubmitted: (value) {
                      if (value == "ሀ") {
                      } else {}
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(51, 53, 123, 0.7),
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(51, 53, 123, 0.7),
                          width: 2.0,
                        ),
                      ),
                      labelText: "What's the sign?",
                      labelStyle: const TextStyle(
                        color: Color.fromRGBO(51, 53, 123, 0.7),
                      ),
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
