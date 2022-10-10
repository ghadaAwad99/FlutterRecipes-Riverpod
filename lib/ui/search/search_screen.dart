import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes_app/ui/search/search_state.dart';
import 'package:recipes_app/ui/search/search_viewModel.dart';
import 'package:recipes_app/ui/search/widgets/grid_recipe_card.dart';

import '../home/widgets/filtered_recipe_card.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);
  static const String tag = "SearchScreen";

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    SearchState state = ref.watch(searchViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
      ),
      body: state.isSearchLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
            children: [
              GridView.count(
        shrinkWrap: true,
                  crossAxisCount: 2,
                  children: List.generate(state.recipesList?.length ?? 0, (index) {
                    return GridRecipeCard(
                      recipe: state.recipesList![index],
                    );
                  }),
                ),
            ],
          ),
    );
  }
}
