import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes_app/data/remote/recipes/i_recipes_repository.dart';
import 'package:recipes_app/data/remote/recipes/services/recipe_details_service.dart';
import 'package:recipes_app/data/remote/recipes/services/search_recipes_service.dart';
import 'package:recipes_app/data/remote/recipes/services/suggested_recipes_service.dart';
import 'package:recipes_app/utils/network/api_response.dart';

final recipesRepositoryProvider = Provider<IRecipesRepository>((ref) => RecipesRepository());

class RecipesRepository extends IRecipesRepository {
  final SuggestedRecipesService _suggestedRecipesService =
      SuggestedRecipesService();
  final SearchRecipesService _searchRecipesService = SearchRecipesService();
  final RecipeDetailsService _recipeDetailsService = RecipeDetailsService();

  @override
  Future<ApiResponse> getSuggestedRecipes() =>
      _suggestedRecipesService.getSuggestedRecipes();

  @override
  Future<ApiResponse> getRecipesWithQuery({required String query}) =>
      _searchRecipesService.getRecipesByQuery(query: query);

  @override
  Future<ApiResponse> getRecipeDetails({required String recipeId}) {
    print("inside repo getRecipeDetails");
    return  _recipeDetailsService.getRecipeDetails(recipeId: recipeId);
  }

}
