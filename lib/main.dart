import 'package:flutter/material.dart';
import 'package:flutter_apptest3/screen/intro.dart';
import 'package:flutter_apptest3/screen/load_asset.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SpriteSheet2().initialize;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Database',
      theme: ThemeData(
        colorScheme: ThemeData().colorScheme.copyWith(
            secondary: Colors.redAccent,
        ),
      ),
      home: const Intro(),
    );
  }
}
