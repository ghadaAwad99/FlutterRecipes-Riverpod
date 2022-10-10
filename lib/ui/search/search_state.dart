import '../../data/remote/recipes/models/recipes_search_response.dart';

class SearchState {
  bool isSearchLoading;
  List<Result>? recipesList;

  SearchState({this.isSearchLoading = false, this.recipesList});

  SearchState copyWith({
    List<Result>? recipesList,
    bool? isSearchLoading,
  }) {
    return SearchState(
        recipesList: recipesList ?? this.recipesList,
        isSearchLoading: isSearchLoading ?? this.isSearchLoading);
  }
}
