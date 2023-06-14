import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

// String js = '''
//   (() => {
//   const modelViewer = document.querySelector('#Home-Page-Greet');

//   self.setInterval(() => {
//     modelViewer.animationName = modelViewer.animationName === 'Lift' ? 'Hu' : 'Lift';
//     modelViewer.play({repetitions: 0});
//   }, 1500.0);
//   const pause = () => {
//     const modelViewer = document.querySelector('#Home-Page-Greet');
//     modelViewer.pause();
//   };
//   modelViewer.addEventListener('load', pause);
//   modelViewer.addEventListener('finished', pause);
//   })();
// ''';

class ChallengeAvatar extends StatelessWidget {
  String lis = '[]';
  ChallengeAvatar({
    super.key,
    required this.lis,
  });

  @override
  Widget build(BuildContext context) {
    print(lis);
    String js = '''
      const modelViewer = document.querySelector('#Home-Page-Greet');
      const speeds = [1, 2, 0.5, -1];
      const Names = $lis;


      let i = 0;
      let j = 0;
      function stop(){
        const modelViewer = document.querySelector('#Home-Page-Greet');
        modelViewer.pause();
        player();
      };

      const player = () => {
        const modelViewer = document.querySelector('#Home-Page-Greet');
        modelViewer.animationName = Names[j++%Names.length];
        modelViewer.play({repetitions: 1});
        t=modelViewer.duration;
        t=t*1000/2 ;// because duration is in second and time to play and rewind//
        setTimeout(stop, t);

      };

      modelViewer.addEventListener('load', player);
      //modelViewer.addEventListener('finished', player);

    ''';
    return ModelViewer(
      animationCrossfadeDuration: 300,
      id: "Home-Page-Greet",
      cameraControls: false,
      cameraOrbit: "0deg 90deg 3.5m",
      disableZoom: true,
      disablePan: true,
      animationName: "Lift",
      autoPlay: false,
      ar: false,
      shadowIntensity: 1,
      src: "assets/TextToSign.glb",
      alt: "An animate 3D model of a robot",
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      relatedJs: js,
    );
  }
}
