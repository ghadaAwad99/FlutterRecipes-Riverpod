import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes_app/ui/search/search_state.dart';
import 'package:recipes_app/utils/network/api_response.dart';
import '../../base/response_handler.dart';
import '../../data/remote/recipes/i_recipes_repository.dart';
import '../../data/remote/recipes/models/recipes_search_response.dart';
import '../../data/remote/recipes/recipes_repository.dart';

final searchViewModelProvider =
StateNotifierProvider.autoDispose<SearchViewModel, SearchState>(
        (ref) => SearchViewModel(ref.watch(recipesRepositoryProvider)));

class SearchViewModel extends StateNotifier<SearchState> {
  SearchViewModel(this.recipesRepository) : super(SearchState());

  final IRecipesRepository recipesRepository;

  getRecipesWithQuery({required String query}) async {
    state = state.copyWith(isSearchLoading: true);
    ApiResponse response = await recipesRepository.getRecipesWithQuery(query: query);
    handleResponse(
        result: response,
        onSuccess: () {
          RecipesSearchResponse recipesResponse =(response.data as RecipesSearchResponse);
          state = state.copyWith(recipesList: recipesResponse.results, isSearchLoading: false);
        },
        onFailed: () {
          print("ERROR FETCHING SEARCH RESULTS");
          state = state.copyWith(isSearchLoading: true);
        }
    );
  }
}