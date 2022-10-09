import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes_app/base/response_handler.dart';
import 'package:recipes_app/data/remote/recipes/i_recipes_repository.dart';
import 'package:recipes_app/data/remote/recipes/models/recipes_response_entity.dart';
import 'package:recipes_app/data/remote/recipes/models/recipes_search_response.dart';
import 'package:recipes_app/data/remote/recipes/recipes_repository.dart';
import 'package:recipes_app/presentation/home/home_state.dart';
import 'package:recipes_app/utils/constants.dart';
import 'package:recipes_app/utils/network/api_response.dart';

final homeViewModelProvider =
    StateNotifierProvider.autoDispose<HomeViewModel, HomeState>(
        (ref) => HomeViewModel(ref.watch(recipesRepositoryProvider)));

class HomeViewModel extends StateNotifier<HomeState> {
  HomeViewModel(this.recipesRepository) : super(HomeState(recipes: [])){
    getSuggestedRecipes();
    getRecipesWithQuery(query: lunch);
  }
  final IRecipesRepository recipesRepository;

  updateLoadingState() {
    state = state.copyWith(isDetailsLoading: true);
  }
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

  changeFilterType(FilterType filterType) {
    switch(filterType) {
      case FilterType.LUNCH:
        state = state.copyWith(isLunchSelected: true, isSaladsSelected: false, isDessertsSelected: false);
        getRecipesWithQuery(query: lunch);
        break;
      case FilterType.DESSERT:
        state = state.copyWith(isDessertsSelected: true, isSaladsSelected: false, isLunchSelected: false);
        getRecipesWithQuery(query: dessert);
        break;
      case FilterType.SALAD:
        state = state.copyWith(isSaladsSelected: true, isDessertsSelected: false, isLunchSelected: false);
        getRecipesWithQuery(query: salad);
    }
  }

  getRecipesWithQuery({required String query}) async {
    state = state.copyWith(isFilteredRecipesLoading: true);
    ApiResponse response = await recipesRepository.getRecipesWithQuery(query: query);
    handleResponse(
        result: response,
        onSuccess: () {
          RecipesSearchResponse recipesResponse =(response.data as RecipesSearchResponse);
          state = state.copyWith(filteredRecipes: recipesResponse.results, isFilteredRecipesLoading: false);
        },
        onFailed: () {
          print("ERROR FETCHING SUGGESTED RECIPES");
          state = state.copyWith(isFilteredRecipesLoading: true);
        }
    );
  }

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

enum FilterType { LUNCH, SALAD, DESSERT }
