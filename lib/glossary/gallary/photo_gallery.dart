import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'eight_way_swipe_detector.dart';
import 'app_haptics.dart';

part './_animated_cutout_overlay.dart';

var imgs = [
  "ha.PNG",
  "leh.PNG",
  "hah.PNG",
  "meh.PNG",
  "seh.PNG",
  "re.PNG",
  "seh2.PNG",
  "she.PNG",
  "ke.PNG",
  "be.PNG",
  "te.PNG",
  "che.PNG",
  "ha1.PNG",
  "ne.PNG",
  "gne.PNG",
  "ah.PNG",
  "keh.PNG",
  "weh.PNG",
  "ah1.PNG",
  "ze.PNG",
  "zhe.PNG",
  "ye.PNG",
  "de.PNG",
  "je.PNG",
  "ge.PNG",
  "teh.PNG",
  "cheh.PNG",
  "peh.PNG",
  "tseh.PNG",
  "tseh1.PNG",
  "feh.PNG",
  "pehh.PNG",
];

class PhotoGallery extends StatefulWidget {
  const PhotoGallery({
    Key? key,
    this.imageSize,
  }) : super(key: key);
  final Size? imageSize;

  @override
  State<PhotoGallery> createState() => _PhotoGalleryState();
}

class _PhotoGalleryState extends State<PhotoGallery> {
  static const int _gridSize = 5;
  // Index starts in the middle of the grid (eg, 25 items, index will start at 13)
  int _index = ((_gridSize * _gridSize) / 2).round();
  Offset _lastSwipeDir = Offset.zero;
  final double _scale = 1;
  bool _skipNextOffsetTween = false;
  late Duration swipeDuration = Duration(milliseconds: 600) * .4;
  final _photoIds = ValueNotifier<List<String>>([]);
  int get _imgCount => pow(_gridSize, 2).round();

  @override
  void initState() {
    super.initState();
    _initPhotoIds();
  }

  Future<void> _initPhotoIds() async {
    var ids = ["a", "a", "a", "a", "a", "a", "a", "a", "a", "a"];

    setState(() => _photoIds.value = ids ?? []);
  }

  void _setIndex(int value, {bool skipAnimation = false}) {
    if (value < 0 || value >= _imgCount) return;
    _skipNextOffsetTween = skipAnimation;
    setState(() => _index = value);
  }

  /// Determine the required offset to show the current selected index.
  /// index=0 is top-left, and the index=max is bottom-right.
  Offset _calculateCurrentOffset(double padding, Size size) {
    double halfCount = (_gridSize / 2).floorToDouble();
    Size paddedImageSize = Size(size.width + padding, size.height + padding);
    // Get the starting offset that would show the top-left image (index 0)
    final originOffset = Offset(
        halfCount * paddedImageSize.width, halfCount * paddedImageSize.height);
    // Add the offset for the row/col
    int col = _index % _gridSize;
    int row = (_index / _gridSize).floor();
    final indexedOffset =
        Offset(-paddedImageSize.width * col, -paddedImageSize.height * row);
    return originOffset + indexedOffset;
  }

  /// Converts a swipe direction into a new index
  void _handleSwipe(Offset dir) {
    // Calculate new index, y swipes move by an entire row, x swipes move one index at a time
    int newIndex = _index;
    if (dir.dy != 0) newIndex += _gridSize * (dir.dy > 0 ? -1 : 1);
    if (dir.dx != 0) newIndex += (dir.dx > 0 ? -1 : 1);
    // After calculating new index, exit early if we don't like it...
    if (newIndex < 0 || newIndex > _imgCount - 1)
      return; // keep the index in range
    if (dir.dx < 0 && newIndex % _gridSize == 0)
      return; // prevent right-swipe when at right side
    if (dir.dx > 0 && newIndex % _gridSize == _gridSize - 1)
      return; // prevent left-swipe when at left side
    _lastSwipeDir = dir;
    AppHaptics.lightImpact();
    _setIndex(newIndex);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<String>>(
        valueListenable: _photoIds,
        builder: (_, value, __) {
          if (value.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          Size imgSize = Size(MediaQuery.of(context).size.width * .66,
              MediaQuery.of(context).size.height * .5);
          imgSize = (widget.imageSize ?? imgSize) * _scale;
          // Get transform offset for the current _index
          final padding = 24.0;

          var gridOffset = _calculateCurrentOffset(padding, imgSize);
          gridOffset += Offset(0, -MediaQuery.of(context).padding.top / 2);
          final offsetTweenDuration =
              _skipNextOffsetTween ? Duration.zero : swipeDuration;
          final cutoutTweenDuration =
              _skipNextOffsetTween ? Duration.zero : swipeDuration * .5;
          return _AnimatedCutoutOverlay(
            animationKey: ValueKey(_index),
            cutoutSize: imgSize,
            swipeDir: _lastSwipeDir,
            duration: cutoutTweenDuration,
            opacity: _scale == 1 ? .7 : .5,
            child: SafeArea(
              bottom: false,
              // Place content in overflow box, to allow it to flow outside the parent
              child: OverflowBox(
                maxWidth: _gridSize * imgSize.width + padding * (_gridSize - 1),
                maxHeight:
                    _gridSize * imgSize.height + padding * (_gridSize - 1),
                alignment: Alignment.center,
                // Detect swipes in order to change index
                child: EightWaySwipeDetector(
                  onSwipe: _handleSwipe,
                  threshold: 30,
                  // A tween animation builder moves from image to image based on current offset
                  child: TweenAnimationBuilder<Offset>(
                    tween: Tween(begin: gridOffset, end: gridOffset),
                    duration: offsetTweenDuration,
                    curve: Curves.easeOut,
                    builder: (_, value, child) =>
                        Transform.translate(offset: value, child: child),
                    child: GridView.count(
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisCount: _gridSize,
                      childAspectRatio: imgSize.aspectRatio,
                      mainAxisSpacing: padding,
                      crossAxisSpacing: padding,
                      children: List.generate(
                          _imgCount,
                          (i) => Container(
                                padding: EdgeInsets.all(0), // Border width
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  border: Border.all(
                                    width: 2.0,
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(
                                          5.0) //                 <--- border radius here
                                      ),
                                ),
                                child: Stack(
                                  children: [
                                    Center(
                                      child: SizedBox(
                                        height: 140,
                                        width: 230,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          child: Image.asset(
                                            width: 220,
                                            "assets/signs/${imgs[i % 30]}",
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      color: Color.fromARGB(57, 58, 55, 47),
                                      width: double.maxFinite,
                                      height: double.maxFinite,
                                    )
                                  ],
                                ),
                              )),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
