import 'package:flutter/material.dart';
import 'package:recipes_app/data/remote/recipes/models/recipes_response_entity.dart';
import 'package:recipes_app/data/remote/recipes/models/recipes_search_response.dart';
import 'package:recipes_app/ui/recipe_details/recipe_details_screen.dart';
import 'package:recipes_app/utils/app_colors.dart';

class FilteredRecipeCard extends StatelessWidget {
  const FilteredRecipeCard({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  final Result recipe;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
            context,
            RecipeDetailsScreen.tag,
            arguments: Recipe(id: recipe.id)
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color: AppColors.appGrey,
          ),
        ),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: SizedBox(
                width: 150,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      recipe.image ?? "",
                      fit: BoxFit.cover,
                    )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: 150,
                      child: Text(
                        recipe.title ?? "",
                        style: const TextStyle(fontSize: 17),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      )
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Container(
                      height: 1,
                      width: 60,
                      color: AppColors.green,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if(recipe.analyzedInstructions?.isNotEmpty ?? false)
                      Chip(
                        labelStyle: TextStyle(color: Colors.white),
                        backgroundColor: AppColors.green,
                        label: Text("${
                            recipe.analyzedInstructions?[0].steps
                                ?.length
                                .toString()
                        } Steps"),
                      ),
                      SizedBox(width: 6,),
                      Chip(
                        labelStyle: TextStyle(color: AppColors.green),
                        backgroundColor: AppColors.lightGreen,
                        label: Row(
                          children: [
                            Text("${
                                recipe.readyInMinutes
                            } min"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}