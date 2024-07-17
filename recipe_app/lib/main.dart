import 'package:flutter/material.dart';
import 'package:recipe_app/utils/routes.dart';
import 'package:recipe_app/view/screen/detail_page.dart';
import 'package:recipe_app/view/screen/favourite_page.dart';
import 'package:recipe_app/view/screen/home_page.dart';
import 'package:recipe_app/view/screen/meal_page.dart';
import 'package:recipe_app/view/screen/recipe_page.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        MyRoutes.homePage: (context) => const HomePage(),
        MyRoutes.detailPage: (context) => const DetailPage(),
        MyRoutes.mealPage: (context) => const MealPage(),
        MyRoutes.favouritePage: (context) => const FavouritePage(),
        MyRoutes.recipePage: (context) => const RecipePage(),
      },
    );
  }
}
