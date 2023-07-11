import 'package:flutter/material.dart';

import 'input_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          appBarTheme:
              AppBarTheme(backgroundColor: Colors.black, centerTitle: true),
          scaffoldBackgroundColor: Colors.black,
          primaryColor: Colors.red,
          textTheme: const TextTheme(
              bodyMedium: TextStyle(color: Colors.white, fontSize: 20.0)),
          iconTheme: IconThemeData(color: Colors.white, size: 30.0)),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('BMI Calculator'),
        ),
        body: const SafeArea(child: BmiPage()),
      ),
    );
  }
}
