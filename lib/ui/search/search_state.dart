import 'package:recipes_app/data/remote/recipes/models/recipes_search_suggestion.dart';
import 'package:recipes_app/ui/search/search_screen.dart';

import '../../data/remote/recipes/models/recipes_search_response.dart';

class SearchState {
  bool isSearchLoading;
  List<Result>? recipesList;
  String? searchQuery;
  List<SearchSuggestions>? suggestionsList;

  SearchState(
      {this.isSearchLoading = false, this.recipesList, this.searchQuery, this.suggestionsList});

  SearchState copyWith({
    List<Result>? recipesList,
    bool? isSearchLoading,
    String? searchQuery,
    List<SearchSuggestions>? searchSuggestions,
  }) {
    return SearchState(
      recipesList: recipesList ?? this.recipesList,
      isSearchLoading: isSearchLoading ?? this.isSearchLoading,
      searchQuery: searchQuery ?? this.searchQuery,
      suggestionsList: searchSuggestions ?? this.suggestionsList,
    );
  }
}
