import 'package:flutter/material.dart';
import 'package:news_app/AppTheme.dart';
import 'package:news_app/HomeScreen.dart';
import 'package:news_app/categories/CategoriesScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: NewsTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      routes: {
        HomeScreen.homeScreen :(context)=> HomeScreen(),
      //  CategoriesScreen.category_screen :(context)=> CategoriesScreen(),
      },

    );
  }
}
//db176f08e424445cb2bba5c6fe0fc6b1
