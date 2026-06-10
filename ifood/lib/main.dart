import 'package:flutter/material.dart';
import 'home_screen.dart';

void main() {
  runApp(const IFoodCloneApp());
}

class IFoodCloneApp extends StatelessWidget {
  const IFoodCloneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iFood Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFFEA1D2C),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Color(0xFFEA1D2C)),
          titleTextStyle: TextStyle(
            color: Colors.black, 
            fontWeight: FontWeight.bold, 
            fontSize: 16
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}