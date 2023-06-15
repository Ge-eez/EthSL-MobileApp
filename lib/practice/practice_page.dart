import 'package:flutter/material.dart';

import '../mp_web_view/test_wv.dart';

class PracticePage extends StatefulWidget {
  const PracticePage({super.key});

  @override
  State<PracticePage> createState() => _PracticePageState();
}

class _PracticePageState extends State<PracticePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, top: 120),
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 1),
            border: Border.all(
              width: 1.0,
              color: Color.fromRGBO(51, 53, 123, 1),
            ),
            borderRadius: BorderRadius.all(
                Radius.circular(16.0) //                 <--- border radius here
                ),
          ),
          height: 200,
          width: MediaQuery.of(context).size.width * 0.9,
          child: Stack(
            children: [
              Positioned(
                right: -30,
                bottom: 0,
                child: SizedBox(
                  height: 140,
                  width: 230,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset(
                      width: 220,
                      "assets/woman.jpg",
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 28,
                bottom: 35,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(51, 53, 123, 1),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WebViewApp()),
                    );
                  },
                  child: const SizedBox(
                    width: 65,
                    height: 45,
                    child: Center(
                        child: Text(
                      "Start",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.fade,
                      ),
                    )),
                  ),
                ),
              ),
              Positioned(
                top: 20,
                left: 25,
                child: RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: const <TextSpan>[
                      TextSpan(
                        text: "ሙከራ ይጀምሩ!",
                        style: TextStyle(
                          color: Color.fromRGBO(51, 53, 123, 1),
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
