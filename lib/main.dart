import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timer_provider/src/provider//provider.dart';
import 'package:timer_provider/src/provider//view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const TimerPage(),
    );
  }
}