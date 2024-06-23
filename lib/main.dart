import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_app/appStyles/appStyles.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(RealEstateApp());
}

class RealEstateApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Real Estate App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppStyles.primary),
        fontFamily: 'Montserrat',
        textTheme:  const TextTheme(
          displayLarge: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(fontFamily: 'Montserrat'),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
