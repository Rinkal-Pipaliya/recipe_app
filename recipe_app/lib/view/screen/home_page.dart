import 'package:flutter/material.dart';
import 'package:recipe_app/utils/product_utils.dart';
import 'package:recipe_app/utils/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> allRecipeData = allRecipe;
  Set<int> likedRecipes = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      backgroundColor: Colors.grey[500],
      appBar: AppBar(
        title: const Text("Recipe App"),
        backgroundColor: Colors.grey[200],
        actions: [
          IconButton(
            icon: const Icon(Icons.bookmark),
            onPressed: () {
              Navigator.pushNamed(context, MyRoutes.recipePage);
            },
          ),
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Navigator.pushNamed(context, MyRoutes.favouritePage,
                  arguments: likedRecipes.toList());
            },
          ),
          IconButton(
            icon: const Icon(Icons.add_shopping_cart),
            onPressed: () {
              Navigator.pushNamed(context, MyRoutes.mealPage);
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: allRecipeData.length,
        itemBuilder: (context, index) {
          final recipe = allRecipeData[index];
          final int prepTime = recipe['prepTimeMinutes'] as int;
          final int cookTime = recipe['cookTimeMinutes'] as int;
          final int totalTime = prepTime + cookTime;
          final List<String> mealTypes =
              List<String>.from(recipe['mealType'] as List);
          final List<String> instructions =
              List<String>.from(recipe['instructions'] as List);
          final int instructionsCount = instructions.length;
          final List<String> ingredients =
              List<String>.from(recipe['ingredients'] as List);
          final int ingredientsCount = ingredients.length;
          final bool isLiked = likedRecipes.contains(recipe['id']);

          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, MyRoutes.detailPage,
                  arguments:
                      recipe); // Navigate to detail page with recipe data
            },
            child: Card(
              margin: const EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(recipe['image'] as String),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                recipe['name'] as String,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                isLiked
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: isLiked ? Colors.red : Colors.grey,
                              ),
                              onPressed: () {
                                setState(() {
                                  if (isLiked) {
                                    likedRecipes.remove(recipe['id']);
                                  } else {
                                    likedRecipes.add(recipe['id']);
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Meal Type: ${mealTypes.join(', ')}',
                          style: const TextStyle(fontSize: 14),
                        ),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.yellow[700]),
                            const SizedBox(width: 5),
                            Text(
                              '${recipe['rating']} (${recipe['reviewCount']} reviews)',
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Total time: $totalTime minutes',
                          style: const TextStyle(fontSize: 14),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Instructions: $instructionsCount steps',
                          style: const TextStyle(fontSize: 14),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Ingredients: $ingredientsCount items',
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
