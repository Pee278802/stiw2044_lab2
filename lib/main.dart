import 'package:flutter/material.dart';
import 'package:info_pc/view/splashpage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.lightGreen),
      ),
      title: 'INFO PC',
      home: const Scaffold(
        body: SplashPage(),
      ),
    );
  }
}
