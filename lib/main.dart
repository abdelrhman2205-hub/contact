import 'package:contact/screens/home_sceen.dart';
import 'package:contact/screens/splash_screen.dart';
import 'package:contact/utils/routes.dart';
import 'package:contact/utils/themes_app.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      routes: {
        routes.splashScreen: (context) => SplashScreen(

        ),
        routes.homeScreen: (context) => HomeScreen(),
      },
      initialRoute: routes.splashScreen,
    );
  }
}

