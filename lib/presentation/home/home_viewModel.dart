import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes_app/base/response_handler.dart';
import 'package:recipes_app/data/remote/recipes/i_recipes_repository.dart';
import 'package:recipes_app/data/remote/recipes/models/recipes_response_entity.dart';
import 'package:recipes_app/data/remote/recipes/recipes_repository.dart';
import 'package:recipes_app/presentation/home/home_state.dart';
import 'package:recipes_app/utils/network/api_response.dart';

final homeViewModelProvider =
    StateNotifierProvider.autoDispose<HomeViewModel, HomeState>(
        (ref) => HomeViewModel(ref.watch(recipesRepositoryProvider)));

class HomeViewModel extends StateNotifier<HomeState> {
  HomeViewModel(this.recipesRepository) : super(HomeState(recipes: [])){
    getSuggestedRecipes();
  }
  final IRecipesRepository recipesRepository;

  getSuggestedRecipes() async {
    state = state.copyWith(isSuggestedRecipesLoading: true);
    ApiResponse response = await recipesRepository.getSuggestedRecipes();

    handleResponse(
        result: response,
        onSuccess: () {
          RecipesResponse recipesResponse =(response.data as RecipesResponse);
          state = state.copyWith(recipes: recipesResponse.recipes, isSuggestedRecipesLoading: false);
        },
      onFailed: () {
          print("ERROR FETCHING SUGGESTED RECIPES");
          state = state.copyWith(isSuggestedRecipesLoading: true);
      }
    );
  }

}
