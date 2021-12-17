import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apptest3/screen/contacts.dart';
import 'package:flutter_apptest3/screen/intro.dart';
import 'package:flutter_apptest3/screen/load_asset.dart';
import 'package:flutter_apptest3/screen/coin.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //await coinAnimation();
  SpriteSheet2().initialize;
  //SpriteSheet().initialized;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

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
      home: Intro(),
    );
  }
}
