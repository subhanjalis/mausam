import 'package:clima/screens/loading_screen2.dart';
import 'package:clima/screens/verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima/screens/loading_screen.dart';
import 'package:geolocator/geolocator.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  return runApp(MyApp());}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: LoadingScreen2(),
    );
  }
}
