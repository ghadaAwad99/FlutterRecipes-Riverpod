import 'package:flutter/material.dart';
import 'package:recipes_app/data/remote/recipes/models/recipes_response_entity.dart';
import 'package:recipes_app/ui/recipe_details/recipe_details_screen.dart';
import 'package:recipes_app/ui/search/widgets/suggestions_widget.dart';

class CustomSearchDelegate extends SearchDelegate {
  final Function(String) onQueryChange;
  CustomSearchDelegate({required this.onQueryChange, });
  late int suggestedRecipeId;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  void showResults(BuildContext context) {
    super.showResults(context);
    Navigator.pushNamed(context, RecipeDetailsScreen.tag,
        arguments: Recipe(id: suggestedRecipeId));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    onQueryChange(query);
      return SuggestionsWidget(
        query: query,
          onTap: (recipeId) {
          suggestedRecipeId = recipeId;
          showResults(context);
      });
  }
}
