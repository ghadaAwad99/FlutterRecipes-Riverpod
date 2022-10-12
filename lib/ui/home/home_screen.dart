import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes_app/ui/home/home_state.dart';
import 'package:recipes_app/ui/home/home_viewModel.dart';
import 'package:recipes_app/ui/home/widgets/filtered_recipe_card.dart';
import 'package:recipes_app/ui/home/widgets/filters_chips.dart';
import 'package:recipes_app/ui/home/widgets/recipe_card_builder.dart';
import 'package:recipes_app/utils/widgets/custom_app_bar.dart';

import '../search/delegate.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const tag = "HomeScreen";

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    HomeState state = ref.watch(homeViewModelProvider);
    HomeViewModel viewModel = ref.read(homeViewModelProvider.notifier);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: buildCustomAppbar(
            context: context,
        onSearch: ()  {
            showSearch(
              context: context,
              delegate: CustomSearchDelegate(onQueryChange: (query){
                WidgetsBinding.instance.addPostFrameCallback((_){
                  viewModel.getSearchSuggestions(query: query);
                });
              })
          );

        }),
        body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Suggested Recipes",
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    state.isSuggestedRecipesLoading ? Center(child: CircularProgressIndicator())
                  : SizedBox(
                      width: 500,
                      height: 180,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>
                            RecipeCard(state: state, index: index, context: context),
                        itemCount: state.recipes?.length,
                      ),
                    ),
                    FiltersChips(state: state, viewModel: viewModel),
                    state.isFilteredRecipesLoading
                    ? Center(child: CircularProgressIndicator())
                    : Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) =>
                              FilteredRecipeCard(recipe: state.filteredRecipes![index],),
                          itemCount: state.filteredRecipes?.length,
                        ),
                      ),
                    ),
                  ],
                ),
        )
    );
  }
}