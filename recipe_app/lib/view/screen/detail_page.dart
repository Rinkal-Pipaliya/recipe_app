import 'package:flutter/material.dart';
import 'package:recipe_app/utils/product_utils.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> recipe = (ModalRoute.of(context)?.settings.arguments ??
        allRecipe[0]) as Map<String, dynamic>;

    void addToMeal() {
      // Implement the logic to add the recipe to the meal list
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${recipe['name']} added to meal.'),
        ),
      );
    }

    void addToFavourite() {
      // Implement the logic to add the recipe to the favourite list
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${recipe['name']} added to favourite.'),
        ),
      );
    }

    Color getDifficultyColor(String difficulty) {
      switch (difficulty.toLowerCase()) {
        case 'easy':
          return Colors.green;
        case 'medium':
          return Colors.orange;
        case 'hard':
          return Colors.red;
        default:
          return Colors.black;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(recipe['name'] as String),
        backgroundColor: Colors.grey[200],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(recipe['image'] as String),
            const SizedBox(height: 16),
            Text(
              recipe['name'] as String,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Cuisine: ${recipe['cuisine']}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Difficulty: ${recipe['difficulty']}',
              style: TextStyle(
                fontSize: 16,
                color: getDifficultyColor(recipe['difficulty'] as String),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Calories per serving: ${recipe['caloriesPerServing']}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton.icon(
              onPressed: addToMeal,
              icon: const Icon(Icons.add_shopping_cart),
              label: const Text('Add to Meal'),
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
            ),
            ElevatedButton.icon(
              onPressed: addToFavourite,
              icon: const Icon(Icons.favorite),
              label: const Text('Add to Favourite'),
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
