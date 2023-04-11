import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../widgets/avatar_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(140), // Set this height
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
                                text: "Hi, Jane\n",
                                style: TextStyle(
                                    color: Color.fromRGBO(51, 53, 123, 0.7),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: "Welcome!\n",
                                style: TextStyle(
                                  color: Color.fromRGBO(51, 53, 123, 0.7),
                                  fontSize: 40,
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
        body: Stack(
          children: [
            GreetingAvatar(),
            Positioned(
              right: 20,
              top: 20,
              child: Container(
                height: 120,
                width: 120,
                child: DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 18.0,
                    color: Color.fromRGBO(51, 53, 123, 0.7),
                  ),
                  child: AnimatedTextKit(
                    repeatForever: true,
                    animatedTexts: [
                      RotateAnimatedText('🤗Smile'),
                      RotateAnimatedText('👋Learn'),
                      RotateAnimatedText('👩‍🎓Grow'),
                    ],
                  ),
                ),
                // RichText(
                //   text: const TextSpan(
                //     text: "👋 Hi, Jane\n",
                //     style: TextStyle(
                //         color: Color.fromRGBO(51, 53, 123, 0.7),
                //         fontSize: 18,
                //         fontWeight: FontWeight.bold),
                //   ),
                // ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromRGBO(51, 53, 123, 1),

          //Floating action button on Scaffold
          onPressed: () {
            //code to execute on button press
          },
          child: Icon(
            Icons.explore_rounded,
            size: 30,
          ), //icon inside button
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          //bottom navigation bar on scaffold
          height: 60,
          color: Color.fromRGBO(51, 53, 123, 1),
          shape: CircularNotchedRectangle(), //shape of notch
          notchMargin:
              5, //notche margin between floating button and bottom appbar
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Row(
              //children inside bottom appbar
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  icon: const Icon(
                    Icons.home_rounded,
                    size: 35,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(
                    Icons.local_library_rounded,
                    color: Colors.white,
                    size: 35,
                  ),
                  onPressed: () {},
                ),
                SizedBox(
                  width: 40,
                ),
                IconButton(
                  icon: const Icon(
                    Icons.book_rounded,
                    color: Colors.white,
                    size: 34,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(
                    Icons.settings,
                    color: Colors.white,
                    size: 35,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
        // bottomNavigationBar: BottomNavigationBar(
        //   backgroundColor: Color.fromRGBO(51, 53, 123, 1),
        //   unselectedItemColor: Colors.white,
        //   items: const <BottomNavigationBarItem>[
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.home),
        //       label: 'Home',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.business),
        //       label: 'Business',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.school),
        //       label: 'School',
        //     ),
        //   ],
        //   currentIndex: 0,
        //   selectedItemColor: Colors.white,
        //   onTap: (int) {},
        // ),
      ),
    );
  }
}
