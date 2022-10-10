import 'package:flutter/material.dart';
import 'package:recipes_app/data/remote/recipes/models/recipes_response_entity.dart';
import 'package:recipes_app/data/remote/recipes/models/recipes_search_response.dart';
import 'package:recipes_app/ui/recipe_details/recipe_details_screen.dart';
import 'package:recipes_app/utils/app_colors.dart';

class GridRecipeCard extends StatelessWidget {
  const GridRecipeCard({
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: AspectRatio(
                aspectRatio: 1.5,
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
              padding: const EdgeInsets.all(6.0),
              child: Text(
                recipe.title ?? "",
                style: const TextStyle(fontSize: 17),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}