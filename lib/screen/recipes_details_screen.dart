import 'package:flutter/material.dart';
import 'package:food_recipes_app_with_api/domain/custom_text_style.dart';

class RecipesDetailsScreen extends StatefulWidget {
  String imageSrc; // done
  String title; // done
  String cookTime; // done
  String prepTime; // done
  String rating; // done
  String calories;
  String revCount; // done
  String foodType;
  String difficultLevel;
  String cuisine;
  List<String> ingredientsList;
  List<String> instructionsList;

  /// here we create constructor
  RecipesDetailsScreen(
      {super.key,
      required this.imageSrc,
      required this.title,
      required this.calories,
      required this.cookTime,
      required this.difficultLevel,
      required this.foodType,
      required this.prepTime,
      required this.rating,
      required this.cuisine,
      required this.revCount,
      required this.ingredientsList,
      required this.instructionsList});

  @override
  State<RecipesDetailsScreen> createState() => _RecipesDetailsScreenState();
}

class _RecipesDetailsScreenState extends State<RecipesDetailsScreen> {
  MediaQueryData? mqData;
  @override
  Widget build(BuildContext context) {
    mqData = MediaQuery.of(context);
    return Scaffold(
      body: Stack(
        children: [
          Image.network(widget.imageSrc),

          /// back button
          Positioned(
            top: 21,
            left: 8,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                  backgroundColor: Colors.black26,
                  foregroundColor: Colors.white70,
                  child: const Icon(
                    Icons.arrow_back_ios_rounded,
                    size: 30,
                  )),
            ),
          ),

          /// info
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: mqData!.size.height * 0.55,
              width: mqData!.size.width,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                  boxShadow: [BoxShadow(color: Colors.orange, blurRadius: 7)]),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: mqData!.size.width,
                        height: mqData!.size.height * 0.16,
                        child: Stack(
                          children: [
                            /// title
                            Text(
                              widget.title,
                              style: myTextStyle24(textWeight: FontWeight.bold),
                            ),

                            /// heart icon
                            Positioned(
                                right: 10,
                                top: 30,
                                child: Image.asset(
                                  "assets/icons/heart (3).png",
                                  height: 40,
                                  width: 40,
                                )),

                            /// here we show rating and rating count
                            Positioned(
                                top: 40,
                                child: Row(
                                  children: [
                                    /// people and rev count
                                    Container(
                                      width: mqData!.size.width * 0.19,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                              width: 2,
                                              color: Colors.blueAccent)),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(Icons.person),
                                          Text(
                                            widget.revCount,
                                            style: myTextStyle18(),
                                          )
                                        ],
                                      ),
                                    ),

                                    const SizedBox(
                                      width: 10,
                                    ),

                                    /// star and rating
                                    Container(
                                      width: mqData!.size.width * 0.19,
                                      decoration: BoxDecoration(
                                          color: Colors.orange.shade100
                                              .withOpacity(0.5),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                              color: Colors.orange.shade200,
                                              width: 2)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.star,
                                            color: Colors.orange,
                                          ),
                                          Text(
                                            widget.rating,
                                            style: myTextStyle18(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )),

                            /// other information
                            Positioned(
                                bottom: 16,
                                child: SizedBox(
                                  width: mqData!.size.width,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      /// cuisine
                                      Expanded(
                                        child: Container(
                                          height: 30,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.blueAccent,
                                                  width: 2),
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: Center(
                                            child: Text(
                                              widget.cuisine,
                                              style: myTextStyle12(
                                                  textWeight: FontWeight.w900),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),

                                      /// difficult level
                                      Expanded(
                                        child: Container(
                                          height: 30,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.blueAccent,
                                                  width: 2),
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: Center(
                                            child: Text(
                                              widget.difficultLevel,
                                              style: myTextStyle12(
                                                  textWeight: FontWeight.w900),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),

                                      /// meal type
                                      Expanded(
                                        child: Container(
                                          height: 30,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.blueAccent,
                                                  width: 2),
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: Center(
                                            child: Text(
                                              widget.foodType,
                                              style: myTextStyle12(
                                                  textWeight: FontWeight.w900),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                    ],
                                  ),
                                ))
                          ],
                        ),
                      ),

                      /// here we show cook time and prep time
                      SizedBox(
                        height: 200,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            /// prep time
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.black12.withOpacity(0.06),
                                    borderRadius: BorderRadius.circular(16)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/icons/whisk.png",
                                      height: 60,
                                    ),
                                    Text(
                                      "${widget.prepTime} min",
                                      style: myTextStyle36(),
                                    ),
                                    Text(
                                      "Preparation Time",
                                      style: myTextStyle18(
                                          textFamily: "secondary"),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),

                            /// cooking time
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.black12.withOpacity(0.06),
                                    borderRadius: BorderRadius.circular(16)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/icons/cooking.png",
                                      height: 60,
                                    ),
                                    Text(
                                      "${widget.cookTime} min",
                                      style: myTextStyle36(),
                                    ),
                                    Text("Cooking Time",
                                        style: myTextStyle18(
                                            textFamily: "secondary"))
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),

                      /// here we show Ingredient
                      Text(
                        "Ingredients",
                        style: myTextStyle24(),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: widget.ingredientsList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.blueAccent.shade100
                                      .withOpacity(0.8),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.black,
                                        blurRadius: 3,
                                        spreadRadius: 1,
                                        offset: Offset(1.0, 1.0))
                                  ]),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Image.asset(
                                      "assets/icons/check-mark.png",
                                      height: 40,
                                      width: 40,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Expanded(
                                    child: Text(
                                      widget.ingredientsList[index],
                                      style: const TextStyle(
                                          fontSize: 21,
                                          fontFamily: 'primary',
                                          color: Colors.white),
                                      maxLines: 2,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),

                      const SizedBox(
                        height: 12,
                      ),

                      /// Show Instructions
                      Text(
                        "Instructions",
                        style: myTextStyle24(),
                      ),

                      ListView.builder(
                          itemCount: widget.instructionsList.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: mqData!.size.width * 0.4,
                                    decoration: const BoxDecoration(
                                        color: Colors.orange,
                                        borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(20),
                                            topRight: Radius.circular(20),
                                            topLeft: Radius.circular(5),
                                            bottomLeft: Radius.circular(5))),
                                    child: Row(
                                      children: [
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 3.0),
                                          child: Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              color: Colors.blue,
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                            ),
                                            child: Center(
                                                child: Text(
                                              "${index + 1}",
                                              style: myTextStyle24(
                                                  textFamily: "secondary",
                                                  textColor: Colors.white),
                                            )),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          "Step",
                                          style: myTextStyle24(
                                              textColor: Colors.black,
                                              textFamily: "secondary"),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.blueAccent.shade100
                                          .withOpacity(0.8),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.black,
                                            blurRadius: 3,
                                            spreadRadius: 1,
                                            offset: Offset(1.0, 1.0)),
                                      ],
                                    ),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Image.asset(
                                            "assets/icons/arrow-right.png",
                                            height: 40,
                                            width: 40,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Expanded(
                                          child: Text(
                                            widget.instructionsList[index],
                                            style: const TextStyle(
                                                fontSize: 21,
                                                fontFamily: 'primary',
                                                color: Colors.white),
                                            maxLines: 3,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),

                      const SizedBox(
                        height: 10,
                      ),

                      SizedBox(
                          width: mqData!.size.width,
                          child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  backgroundColor: Colors.orange),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/icons/music-and-multimedia.png",
                                    height: 40,
                                    width: 40,
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "Watch Video",
                                    style: myTextStyle24(),
                                  )
                                ],
                              ))),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

/// check on real Time
/// This screen is Complete Check the complete code
