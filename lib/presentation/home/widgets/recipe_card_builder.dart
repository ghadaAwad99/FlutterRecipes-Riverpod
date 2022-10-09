import 'package:flutter/material.dart';
import 'package:recipes_app/data/remote/recipes/models/recipes_response_entity.dart';
import 'package:recipes_app/presentation/home/home_state.dart';
import 'package:recipes_app/presentation/home/widgets/diets_chips.dart';
import 'package:recipes_app/utils/app_colors.dart';
import '../../recipe_details/recipe_details_screen.dart';

Widget buildRecipeCard(HomeState state, int index, BuildContext context) {

  final stepsString = (state.recipes?[index].analyzedInstructions?[0].steps?.length ?? 0) > 1 ? "Steps" : "Step";

  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(
          context,
          RecipeDetailsScreen.tag,
          arguments: Recipe(id: state.recipes?[index].id)
      );
    },
    child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Colors.grey.shade50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 150,
            height: 180,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  state.recipes?[index].image ?? "",
                  fit: BoxFit.cover,
                )
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    width: 150,
                    child: Text(
                      state.recipes?[index].title ?? "",
                      style: const TextStyle(fontSize: 20),
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
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Chip(
                      labelStyle: TextStyle(color: AppColors.green),
                      backgroundColor: AppColors.lightGreen,
                      label: Text("${
                      state.recipes?[index].analyzedInstructions?[0].steps
                          ?.length
                          .toString()
                    } $stepsString"),
                    ),
                    DietsChips(state: state, index: index,),
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