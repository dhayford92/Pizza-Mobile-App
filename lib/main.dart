import 'package:flutter/material.dart';
import 'package:restuarant_app/components.dart';
import 'pages/welcompage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Resturant App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme:
            const AppBarTheme(iconTheme: IconThemeData(color: Colors.black)),
        primaryColor: AppColours.primaryColour,
        backgroundColor: AppColours.backgroundColour,
      ),
      home: const WelcomePage(),
    );
  }
}
