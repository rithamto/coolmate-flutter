import 'package:coolmate/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:coolmate/theme.dart';
import 'package:coolmate/routes.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coolmate',
      theme: theme(),
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}

