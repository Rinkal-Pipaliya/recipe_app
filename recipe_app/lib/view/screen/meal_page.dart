import 'package:flutter/material.dart';
import 'package:recipe_app/utils/product_utils.dart';
import 'package:recipe_app/utils/routes.dart';

class MealPage extends StatefulWidget {
  const MealPage({super.key});

  @override
  State<MealPage> createState() => _MealPageState();
}

class _MealPageState extends State<MealPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(
              Icons.home_filled,
            ),
            onPressed: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(MyRoutes.homePage, (route) => false);
            },
          )
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        title: const Text(
          "Meals",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: mealitems.isEmpty
                ? const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                          image: NetworkImage(
                              "https://cdn.dribbble.com/users/5107895/screenshots/14532312/media/a7e6c2e9333d0989e3a54c95dd8321d7.gif")),
                      Text(
                        "Your Cart Is Empty!!",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                    ],
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: mealitems.map((e) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            height: 200,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(3, 3),
                                  blurRadius: 3,
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 16),
                                  child: Container(
                                    height: 150,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.grey,
                                          offset: Offset(3, 3),
                                          blurRadius: 3,
                                        ),
                                      ],
                                    ),
                                    child: Image(
                                      image: NetworkImage(
                                        e['image'],
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e['name'],
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border:
                                              Border.all(color: Colors.grey),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const SizedBox(
                                              width: 6,
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                mealitems.remove(e);
                                                setState(() {});
                                              },
                                              child: const Icon(
                                                Icons.delete_forever,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                height: 100,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(3, 3),
                      blurRadius: 5,
                    )
                  ],
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
