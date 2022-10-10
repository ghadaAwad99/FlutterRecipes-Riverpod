import '../../data/remote/recipes/models/recipes_response_entity.dart';

class RecipeDetailsState {
  Recipe? recipeDetails;
  bool? isDetailsLoading;

  RecipeDetailsState({this.isDetailsLoading = true, this.recipeDetails});

  RecipeDetailsState copyWith({bool? isDetailsLoading, Recipe? recipeDetails}) {
    return RecipeDetailsState(
      isDetailsLoading: isDetailsLoading ?? this.isDetailsLoading,
      recipeDetails: recipeDetails ?? this.recipeDetails,
    );
  }
}
