import 'package:flutter/material.dart';
import 'package:recipe_app/utils/product_utils.dart';

class RecipePage extends StatefulWidget {
  const RecipePage({super.key});

  @override
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  late Map<String, dynamic> recipe;
  late List<String> ingredients;
  late List<String> instructions;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    recipe = (ModalRoute.of(context)?.settings.arguments ?? allRecipe[0])
        as Map<String, dynamic>;
    ingredients = List<String>.from(recipe['ingredients'] as List);
    instructions = List<String>.from(recipe['instructions'] as List);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe['name'] as String),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(recipe['image'] as String),
            const SizedBox(height: 16),
            const Text(
              'Ingredients:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List<Widget>.generate(
                ingredients.length,
                (index) => Text('- ${ingredients[index]}'),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Instructions:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List<Widget>.generate(
                instructions.length,
                (index) => Text('${index + 1}. ${instructions[index]}'),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
