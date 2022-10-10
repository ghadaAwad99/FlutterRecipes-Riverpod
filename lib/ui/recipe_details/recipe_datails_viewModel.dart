import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes_app/ui/recipe_details/recipe_details_state.dart';
import '../../base/response_handler.dart';
import '../../data/remote/recipes/i_recipes_repository.dart';
import '../../data/remote/recipes/models/recipes_response_entity.dart';
import '../../data/remote/recipes/recipes_repository.dart';
import '../../utils/network/api_response.dart';

final recipeDetailsViewModelProvider =
StateNotifierProvider.autoDispose<RecipeDetailsViewModel, RecipeDetailsState>(
        (ref) => RecipeDetailsViewModel(ref.watch(recipesRepositoryProvider)));

class RecipeDetailsViewModel extends StateNotifier<RecipeDetailsState> {
  RecipeDetailsViewModel(this.recipesRepository) : super(RecipeDetailsState()) {
  }

  final IRecipesRepository recipesRepository;

  getRecipesDetails({required String recipeId}) async {
    state = state.copyWith(isDetailsLoading: true);
    ApiResponse response = await recipesRepository.getRecipeDetails(recipeId: recipeId);
    handleResponse(
        result: response,
        onSuccess: () {
          Recipe recipe =(response.data as Recipe);
          state = state.copyWith(recipeDetails: recipe, isDetailsLoading: false);
        },
        onFailed: () {
          print("ERROR FETCHING SUGGESTED RECIPES");
          state = state.copyWith(isDetailsLoading: true);
        }
    );
  }
}