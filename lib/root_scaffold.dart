import 'package:blink/practice/practice_page.dart';
import 'package:flutter/material.dart';
import 'challenges/challenges_page.dart';
import 'glossary/glossary_page.dart';
import 'lesson/lessons_page.dart';
import 'mp_web_view/test_wv.dart';
import 'pages.dart';

class RootScaffold extends StatefulWidget {
  const RootScaffold({Key? key}) : super(key: key);

  @override
  State<RootScaffold> createState() => _RootScaffoldState();
}

class _RootScaffoldState extends State<RootScaffold> {
  final List<Widget> _screens = [
    HomePage(),
    LessonsPage(),
    PracticePage(),
    ChallengesPage(),
    GlossaryPage(),
  ];

  // final List<IconData> _icons = [Icons.home, Icons.library_music, Icons.person];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 3,
        selectedItemColor: Color.fromRGBO(255, 255, 255, 1),
        currentIndex: _selectedIndex,
        iconSize: 30,
        selectedLabelStyle: const TextStyle(
          color: Color.fromRGBO(51, 53, 123, 1),
        ),
        unselectedItemColor: Color.fromRGBO(216, 216, 216, 0.651),
        onTap: (index) => setState(() {
          _selectedIndex = index;
        }),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: "ቤት",
            backgroundColor: Color.fromRGBO(51, 53, 123, 1),
            //activeIcon: Icon(Icons.home_rounded, color: Colors.red),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_library_rounded),
            label: "ትምህርቶች",
            backgroundColor: Color.fromRGBO(51, 53, 123, 1),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_searching_rounded),
            label: "ሙከራ",
            backgroundColor: Color.fromRGBO(51, 53, 123, 1),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.golf_course_sharp),
            label: "ፈተና",
            backgroundColor: Color.fromRGBO(51, 53, 123, 1),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_rounded),
            label: "መፍቻ",
            backgroundColor: Color.fromRGBO(51, 53, 123, 1),
          ),
        ],
      ),
    );
  }
}
