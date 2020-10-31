import 'package:flutter/material.dart';

import 'modules/main_page.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // System.Chrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color(0xFF3EBACE),
        accentColor: Color(0xFFD8ECF1),
        scaffoldBackgroundColor: Color(0xFFF3F5F7),
      ),
      home: MainPage(),
    );
  }
}
