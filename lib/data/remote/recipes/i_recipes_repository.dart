import 'package:recipes_app/utils/network/api_response.dart';

abstract class IRecipesRepository {
  Future<ApiResponse> getSuggestedRecipes();
  Future<ApiResponse> getRecipesWithQuery({required String query});
}