import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes_app/data/remote/recipes/models/recipes_response_entity.dart';
import 'package:recipes_app/presentation/home/home_state.dart';
import 'package:recipes_app/presentation/home/home_viewModel.dart';
import 'package:recipes_app/presentation/recipe_details/widgets/ingredients_widget.dart';
import 'package:recipes_app/presentation/recipe_details/widgets/instructions_widget.dart';
import 'package:recipes_app/presentation/recipe_details/widgets/photo_header.dart';
import 'package:recipes_app/utils/app_colors.dart';

class RecipeDetailsScreen extends ConsumerStatefulWidget {
  const RecipeDetailsScreen({Key? key, /*required this.recipe*/}) : super(key: key);
  //final Recipe recipe;
  static const tag = "RecipeDetailsScreen";

  @override
  ConsumerState<RecipeDetailsScreen> createState() => _RecipeDetailsScreenState();
}

class _RecipeDetailsScreenState extends ConsumerState<RecipeDetailsScreen> with TickerProviderStateMixin {
  TabController? _tabController;
  late HomeViewModel viewModel;
  final customIndicator =  BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      color: Colors.white
  );
  final recipeTabs = [const Tab(text: "ingredients",), const Tab(text: "Cooking Instructions",)];

  late Recipe recipe;

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
        children: [
          PhotoHeader(recipe: state.recipeDetails!),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              state.recipeDetails?.title ?? "",
              style: TextStyle(fontSize: 18),
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              textAlign: TextAlign.center,
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