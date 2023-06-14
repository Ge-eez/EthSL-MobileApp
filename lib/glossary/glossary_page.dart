import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class GlossaryPage extends StatefulWidget {
  const GlossaryPage({super.key});

  @override
  State<GlossaryPage> createState() => _GlossaryPageState();
}

class _GlossaryPageState extends State<GlossaryPage> {
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
            ),
            Positioned(
              top: 0,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 42, 0, 0),
                child: Container(
                  color: Color.fromRGBO(51, 53, 123, 1),
                  height: MediaQuery.of(context).size.height / 1.65,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: ClipPath(
                clipper: ClipPathClass(),
                child: Container(
                  height: MediaQuery.of(context).size.height / 1.75,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(228, 228, 228, 1),
                  ),
                  child: Container(),
                ),
              ),
            ),
            Positioned(
              bottom: 80,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(26, 0, 26, 0),
                child: SizedBox(
                  width: 360,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Color.fromRGBO(51, 53, 123, 1), // Background color
                    ),
                    child: Text("Browse All Signs"),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(1, 510, 1, 1),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 400.0,
                  viewportFraction: 1,
                ),
                carouselController: _controller,
                items: [
                  '"EthSL has 33 Unique hand shapes!"',
                  '"Common words have their own\n           unique hand shapes!"',
                  '"Each Sign has 7 unique forms"'
                ].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Text(
                        i,
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Color.fromRGBO(51, 53, 123, 1),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(1, 170, 1, 1),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 300.0,
                  viewportFraction: 0.5,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.5,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index, reason) {
                    _controller.nextPage();
                  },
                ),
                items: [
                  "assets/signs/g1.PNG",
                  "assets/signs/g2.PNG",
                  "assets/signs/g3.PNG"
                ].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: MediaQuery.of(context).size.width / 2.5,
                          margin: EdgeInsets.symmetric(horizontal: 1.0),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(
                              color: Color.fromARGB(255, 255, 255, 255),
                              width: 2,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(100.0), //
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(100.0), //
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100.0),
                                child: Image.asset(
                                  i,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ));
                    },
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ClipPathClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, 60);
    path.quadraticBezierTo(size.width / 2, 0, size.width, 60);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
