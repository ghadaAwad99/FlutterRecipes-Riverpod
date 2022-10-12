import 'package:recipes_app/utils/network/api_response.dart';

abstract class IRecipesRepository {
  Future<ApiResponse> getSuggestedRecipes();
  Future<ApiResponse> getRecipesWithQuery({required String query});
  Future<ApiResponse> getRecipeDetails({required String recipeId,});
  Future<ApiResponse> getSearchSuggestions({required String query});
}