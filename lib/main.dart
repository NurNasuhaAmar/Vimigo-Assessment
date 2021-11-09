import 'package:flutter/material.dart';
import 'package:flutter_apptest3/screen/contacts.dart';
import 'package:flutter_apptest3/screen/intro.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
