import 'package:flutter/material.dart';
import 'package:recipes_app/presentation/home/home_state.dart';
import 'package:recipes_app/presentation/recipe_details/recipe_details_screen.dart';
import 'package:recipes_app/utils/app_colors.dart';

class FilteredRecipeCard extends StatelessWidget {
  const FilteredRecipeCard({
    Key? key,
    required this.state,
    required this.index,
  }) : super(key: key);

  final HomeState state;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
            context,
            RecipeDetailsScreen.tag,
            arguments: state.filteredRecipes?[index]
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
                      state.filteredRecipes?[index].image ?? "",
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
                        state.filteredRecipes?[index].title ?? "",
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
                      Chip(
                        labelStyle: TextStyle(color: Colors.white),
                        backgroundColor: AppColors.green,
                        label: Text("${
                            state.filteredRecipes?[index].analyzedInstructions?[0].steps
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
                                state.filteredRecipes?[index].readyInMinutes
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