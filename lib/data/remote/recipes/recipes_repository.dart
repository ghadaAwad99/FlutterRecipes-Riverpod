import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes_app/data/remote/recipes/i_recipes_repository.dart';
import 'package:recipes_app/data/remote/recipes/services/suggested_recipes_service.dart';
import 'package:recipes_app/utils/network/api_response.dart';

final recipesRepositoryProvider = Provider((ref) => RecipesRepository());

class RecipesRepository extends IRecipesRepository{

  final SuggestedRecipesService _suggestedRecipesService = SuggestedRecipesService();

  @override
  Future<ApiResponse> getSuggestedRecipes() => _suggestedRecipesService.getSuggestedRecipes();

}