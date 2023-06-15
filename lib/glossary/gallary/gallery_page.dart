import 'package:blink/glossary/gallary/photo_gallery.dart';
import 'package:flutter/material.dart';

class GalleryPageView extends StatefulWidget {
  const GalleryPageView({super.key});

  @override
  State<GalleryPageView> createState() => _GalleryPageViewState();
}

class _GalleryPageViewState extends State<GalleryPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const PhotoGallery(),
          Positioned(
            top: 45,
            left: 20,
            child: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(
                Icons.close,
                size: 35,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
