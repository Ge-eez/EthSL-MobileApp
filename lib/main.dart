import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'auth/bloc/secure_storage.dart';
import 'auth/presentations/sign_in_form.dart';
import 'firebase_options.dart';
import 'pages.dart';
import 'package:permission_handler/permission_handler.dart';

List<CameraDescription> cameras = [];
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  await Permission.camera.request();
  await Permission.microphone.request();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const SignIn();
    //return const RootScaffold();
  }
}
