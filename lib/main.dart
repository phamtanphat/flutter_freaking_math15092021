import 'package:flutter/material.dart';
import 'package:flutter_freaking_math15092021/freaking_math_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          bodyText2: TextStyle(fontSize: 20, fontFamily: "Roboto"),
        )
      ),
      home: FreakingMathPage(),
    );
  }
}
