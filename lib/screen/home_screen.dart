import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_recipes_app_with_api/domain/custom_text_style.dart';
import 'package:http/http.dart' as http;

import '../model/recipes_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    hitRecipesApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "KitchenCraft",
          style:
              myTextStyle18(textFamily: "secondary", textColor: Colors.white),
        ),
        centerTitle: true,
        shadowColor: Colors.black,
        elevation: 11,
        foregroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(16))),
        backgroundColor: Colors.orange.shade300,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                "Most Loved Recipes",
                style: myTextStyle18(),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: FutureBuilder(
                  future: hitRecipesApi(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text("Error Found : ${snapshot.error}"),
                      );
                    } else if (snapshot.hasData) {
                      final myRecipes = snapshot.data!.recipes!;

                      /// data show in Grid view
                      return GridView.builder(
                        itemCount: snapshot.data!.recipes!.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.6,
                                crossAxisSpacing: 2,
                                mainAxisSpacing: 2),
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 3,
                            shadowColor: Colors.black,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  /// image
                                  Container(
                                      height: 200,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              "${myRecipes[index].image}"),
                                        ),
                                        borderRadius: BorderRadius.circular(16),
                                      )),
                                  const SizedBox(
                                    height: 10,
                                  ),

                                  /// name
                                  Text(
                                    "${myRecipes[index].name}",
                                    style: myTextStyle12(
                                        textColor: Colors.blueAccent,
                                        textWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),

                                  /// cal
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Calories : ",
                                        style: myTextStyle18(
                                            textColor: Colors.black87),
                                      ),
                                      Text(
                                        "${myRecipes[index].caloriesPerServing}",
                                        style: myTextStyle18(
                                            textColor: Colors.green,
                                            textWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      /// when click on this button Navigate to the Details Screen
                                      ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          21)),
                                              backgroundColor:
                                                  Colors.orange.shade400,
                                              foregroundColor: Colors.white),
                                          child: Text(
                                            "View",
                                            style: myTextStyle18(
                                                textColor: Colors.white,
                                                textWeight: FontWeight.bold),
                                          )),
                                      Text(
                                        "${myRecipes[index].cookTimeMinutes} min",
                                        style: myTextStyle24(
                                            textColor: Colors.black45),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                    return Container();
                  }),
            ),
          ],
        ),
      ),
    );
  }

  ///_______________________________FUNCTION____________________________________///
  Future<RecipesDataModel?> hitRecipesApi() async {
    String url = "https://dummyjson.com/recipes";
    Uri uri = Uri.parse(url);
    http.Response res = await http.get(uri);
    if (res.statusCode == 200) {
      /// here we mission some thing
      var resData = jsonDecode(res.body);
      return RecipesDataModel.fromJson(resData);
    } else {
      return null;
    }
  }
}

/// first we check , hit api click on button press
/// Successfully Hit Api
/// data reflect data on the screen
/// Complete
/// Check
