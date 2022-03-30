import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'screens/map_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QR Reader',
      initialRoute: 'home',
      routes: {
        'home':(_) => HomeScreen(),
        'map': (_) => MapScreen(),
      },
      theme: ThemeData(
        primarySwatch: Colors.indigo
        )
    );
  }
}