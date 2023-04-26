import 'package:flutter/material.dart';

import '../homepage/widgets/avatar_widget.dart';

class TextToSignPage extends StatefulWidget {
  const TextToSignPage({super.key});

  @override
  State<TextToSignPage> createState() => _TextToSignPageState();
}

class _TextToSignPageState extends State<TextToSignPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 35,
            color: Color.fromRGBO(51, 53, 123, 1),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(""),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Container(color: Colors.white),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            child: GreetingAvatar(),
          ),
          Positioned(
            bottom: 10,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 8, 8, 8),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: inputFeild(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class inputFeild extends StatefulWidget {
  const inputFeild({super.key});

  @override
  State<inputFeild> createState() => _inputFeildState();
}

class _inputFeildState extends State<inputFeild> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      height: 61,
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(35.0),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 3), blurRadius: 5, color: Colors.grey)
                ],
              ),
              child: Row(
                children: [
                  IconButton(
                      icon: Icon(
                        Icons.translate_rounded,
                        color: Color.fromRGBO(51, 53, 123, 1),
                      ),
                      onPressed: () {}),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Type Something...",
                          hintStyle:
                              TextStyle(color: Color.fromRGBO(51, 53, 123, 1)),
                          border: InputBorder.none),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 12),
          InkWell(
            onTap: () {
              print("hello");
            },
            child: Container(
              padding: const EdgeInsets.fromLTRB(15.0, 15, 12, 15),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(51, 53, 123, 1),
                  shape: BoxShape.circle),
              child: Icon(
                Icons.send_rounded,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
