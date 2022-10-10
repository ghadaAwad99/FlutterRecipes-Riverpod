import 'package:recipes_app/data/remote/recipes/models/recipes_response_entity.dart';
import 'package:recipes_app/data/remote/recipes/models/recipes_search_response.dart';

class HomeState {
  List<Recipe>? recipes;
  bool isSuggestedRecipesLoading;

  List<Result>? filteredRecipes;
  bool isFilteredRecipesLoading;

  bool? isDessertsSelected;
  bool? isSaladsSelected;
  bool isLunchSelected;

  HomeState(
      {this.recipes,
      this.isSuggestedRecipesLoading = false,
      this.isDessertsSelected,
      this.isSaladsSelected,
      this.isLunchSelected = true,
      this.filteredRecipes,
      this.isFilteredRecipesLoading = false,});

  HomeState copyWith({
    bool? isSuggestedRecipesLoading,
    List<Recipe>? recipes,
    bool? isDessertsSelected,
    bool? isSaladsSelected,
    bool? isLunchSelected,
    List<Result>? filteredRecipes,
    bool? isFilteredRecipesLoading,
  }) {
    return HomeState(
      isSuggestedRecipesLoading:
          isSuggestedRecipesLoading ?? this.isSuggestedRecipesLoading,
      recipes: recipes ?? this.recipes,
      isDessertsSelected: isDessertsSelected ?? this.isDessertsSelected,
      isSaladsSelected: isSaladsSelected ?? this.isSaladsSelected,
      isLunchSelected: isLunchSelected ?? this.isLunchSelected,
      filteredRecipes: filteredRecipes ?? this.filteredRecipes,
      isFilteredRecipesLoading: isFilteredRecipesLoading ?? this.isFilteredRecipesLoading,
      );
  }
}
