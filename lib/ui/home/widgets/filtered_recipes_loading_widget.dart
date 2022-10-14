import 'package:flutter/material.dart';
import 'package:recipes_app/ui/home/widgets/filtered_recipe_card_shimmer.dart';
import 'package:recipes_app/ui/home/widgets/suggested_recipe_card_shimmer.dart';

class FilteredRecipesLoadingWidget extends StatelessWidget {
  const FilteredRecipesLoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ListView.separated(
          scrollDirection: Axis.vertical,
          itemCount: 6,
          shrinkWrap: true,
          separatorBuilder: (context, index) {
            return const Divider(
              indent: 15,
            );
          },
          itemBuilder: (BuildContext context, int index) =>
          FilteredRecipeCardShimmer(),
        ),
      ),
    );
  }
}
