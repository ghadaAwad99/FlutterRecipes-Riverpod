import 'package:recipes_app/data/remote/recipes/models/recipes_response_entity.dart';

class HomeState {
  List<Recipe>? recipes;
  bool isSuggestedRecipesLoading;

  HomeState({this.recipes, this.isSuggestedRecipesLoading = false});

  HomeState copyWith(
      {bool? isSuggestedRecipesLoading,
        List<Recipe>? recipes,}) {
    return HomeState(
        isSuggestedRecipesLoading:
        isSuggestedRecipesLoading ?? this.isSuggestedRecipesLoading,
        recipes: recipes ?? this.recipes);
  }
}
