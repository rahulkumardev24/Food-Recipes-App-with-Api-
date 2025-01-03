import 'package:flutter/material.dart';
import 'package:food_recipes_app_with_api/screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen()
    );
  }
}

/// IN THIS VIDEO WE CREATE
/// _______________ FOOD RECIPES APP ________________ ///
/// API Also Integrate
/// Simple Steps
/// Steps 1
/// Project Setup => DONE
/// step 2
/// create custom text style => done
///
/// Step 3
/// Create Model => DONE
///
/// Step 4
/// Hit API And display Data =>
///
/// Step 5
/// Details Screen Create =>

