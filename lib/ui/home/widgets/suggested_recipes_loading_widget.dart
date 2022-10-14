import 'package:flutter/material.dart';
import 'package:recipes_app/ui/home/widgets/suggested_recipe_card_shimmer.dart';

class SuggestedRecipesLoadingWidget extends StatelessWidget {
  const SuggestedRecipesLoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 190,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 6,
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return const Divider(
                indent: 15,
              );
            },
            itemBuilder: (BuildContext context, int index) =>
                const Padding(
                  padding: EdgeInsetsDirectional.only(bottom: 6),
                  child: SuggestedRecipeCardShimmer(),
                ),
          ),
        ),
      ],
    );
  }
}
