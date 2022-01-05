import 'package:flutter/material.dart';
import 'src/home/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies App',
      theme: ThemeData(
        primaryColor: Colors.white
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false
    );
  }
}