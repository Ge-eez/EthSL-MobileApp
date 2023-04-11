import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

String js = '''
  const modelViewer = document.querySelector('#Home-Page-Greet');
  const speeds = [1, 2, 0.5, -1];

  let i = 0;
  const play = () => {
    modelViewer.timeScale = speeds[i++%speeds.length];
    modelViewer.play({repetitions: 1});
    
  };
  modelViewer.addEventListener('load', play);
  modelViewer.addEventListener('finished', play);
''';

class GreetingAvatar extends StatelessWidget {
  const GreetingAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ModelViewer(
      id: "Home-Page-Greet",
      cameraControls: true,
      disableZoom: true,
      animationName: "Armature|mixamo.com|Layer0",
      ar: false,
      shadowIntensity: 1,
      src: "assets/girlsalute.glb",
      alt: "An animate 3D model of a robot",
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      relatedJs: js,
    );
  }
}
