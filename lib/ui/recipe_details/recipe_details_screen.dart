import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes_app/data/remote/recipes/models/recipes_response_entity.dart';
import 'package:recipes_app/ui/home/home_state.dart';
import 'package:recipes_app/ui/home/home_viewModel.dart';
import 'package:recipes_app/ui/recipe_details/widgets/ingredients_widget.dart';
import 'package:recipes_app/ui/recipe_details/widgets/instructions_widget.dart';
import 'package:recipes_app/ui/recipe_details/widgets/photo_header.dart';
import 'package:recipes_app/utils/app_colors.dart';
import 'package:recipes_app/utils/constants.dart';

class RecipeDetailsScreen extends ConsumerStatefulWidget {
  const RecipeDetailsScreen({Key? key}) : super(key: key);
  static const tag = "RecipeDetailsScreen";

  @override
  ConsumerState<RecipeDetailsScreen> createState() => _RecipeDetailsScreenState();
}

class _RecipeDetailsScreenState extends ConsumerState<RecipeDetailsScreen> with TickerProviderStateMixin {
  TabController? _tabController;
  late HomeViewModel viewModel;
  late Recipe recipe;

  final customIndicator =  BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      color: Colors.white
  );
  final recipeTabs = [const Tab(text: "ingredients",), const Tab(text: "Cooking Instructions",)];

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    viewModel = ref.read(homeViewModelProvider.notifier);
    Future.delayed(
        Duration.zero,
            () {
              recipe = ModalRoute.of(context)!.settings.arguments as Recipe;
              viewModel.getRecipesDetails(recipeId: recipe.id.toString());
            });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    HomeState state = ref.watch(homeViewModelProvider);
    return Scaffold(
      body: state.isDetailsLoading ?? true ? Center(child: CircularProgressIndicator())
     : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PhotoHeader(recipe: state.recipeDetails!),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0, left: 16, right: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  state.recipeDetails?.title ?? "",
                  style: TextStyle(fontSize: 18),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  textAlign: TextAlign.start,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: GestureDetector(
                        onTap: () {
                          launchURL(url: state.recipeDetails?.sourceUrl ?? "");
                        },
                        child: Text(
                          "Visit Recipe Source",
                          style: TextStyle(color: Colors.grey, fontSize: 13),
                        ),
                      ),
                    ),
                    Icon(Icons.keyboard_arrow_right_sharp, size: 14,color: Colors.grey,)
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.grey.shade300,
              ),
              child: TabBar(
                controller: _tabController,
                tabs:recipeTabs,
                indicatorColor: AppColors.green,
                indicator: customIndicator,
                labelColor: AppColors.green,
                unselectedLabelColor: Colors.grey,
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
                controller: _tabController,
                children: [
                  IngredientsWidget(ingredients: state.recipeDetails?.extendedIngredients ?? []),
                  InstructionsWidget(instructions: state.recipeDetails?.analyzedInstructions ?? [],),
                ]
            ),
          )
        ],
      ),
    );
  }
}