import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_socket/screens/initial.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Arm Control',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.indigo,
        accentColor: Colors.indigoAccent,
        //primarySwatch: Colors.blue,
      ),
      home: InitScreen(),
    );
  }
}

