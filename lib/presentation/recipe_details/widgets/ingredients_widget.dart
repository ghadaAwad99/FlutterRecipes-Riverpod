import 'package:flutter/material.dart';
import 'package:recipes_app/data/remote/recipes/models/recipes_response_entity.dart';
import 'package:recipes_app/utils/images.dart';
import 'package:recipes_app/utils/network/end_points.dart';
import 'package:recipes_app/utils/string_extension.dart';

class IngredientsWidget extends StatelessWidget {
  const IngredientsWidget({
    Key? key,
    required this.ingredients,
  }) : super(key: key);

  final List<ExtendedIngredient> ingredients;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6),
      child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: ingredients.length,
          itemBuilder: (context, index) =>
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            height: 60,
                            width: 60,
                            child: ingredients[index].image != null
                                ? Image.network(EndPoints.imageUrl + (ingredients[index].image!))
                                : Image.asset(AppAssets.placeholder)
                        ),
                      ),
                      Spacer(),
                      Expanded(
                        flex: 2,
                        child: Text(
                          ingredients[index].name?.capitalize() ?? "",
                          style: TextStyle(fontSize: 16, color: Colors.grey.shade600,),
                        ),
                      ),
                      Spacer(),
                      Expanded(
                          flex: 1,
                          child: Text(
                            "${ingredients[index].amount}  ${ingredients[index].unit}",
                            style: TextStyle(fontSize: 13),
                          )
                      ),
                    ],
                  ),
                ),
              )
      ),
    );
  }
}