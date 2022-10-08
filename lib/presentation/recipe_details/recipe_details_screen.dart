import 'package:flutter/material.dart';
import 'package:recipes_app/data/remote/recipes/models/recipes_response_entity.dart';
import 'package:recipes_app/presentation/recipe_details/widgets/ingredients_widget.dart';
import 'package:recipes_app/presentation/recipe_details/widgets/instructions_widget.dart';
import 'package:recipes_app/presentation/recipe_details/widgets/photo_header.dart';
import 'package:recipes_app/utils/app_colors.dart';

class RecipeDetailsScreen extends StatefulWidget {
  const RecipeDetailsScreen({Key? key, required this.recipe}) : super(key: key);
  final Recipe recipe;
  static const tag = "RecipeDetailsScreen";

  @override
  State<RecipeDetailsScreen> createState() => _RecipeDetailsScreenState();
}

class _RecipeDetailsScreenState extends State<RecipeDetailsScreen> with TickerProviderStateMixin {
  TabController? _tabController;
  final customIndicator =  BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      color: Colors.white
  );
  final recipeTabs = [const Tab(text: "ingredients",), const Tab(text: "Cooking Instructions",)];

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          PhotoHeader(recipe: widget.recipe),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.recipe.title ?? "",
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
                  IngredientsWidget(ingredients:  widget.recipe.extendedIngredients ?? []),
                  InstructionsWidget(instructions: widget.recipe.analyzedInstructions ?? [],),
                ]
            ),
          )
        ],
      ),
    );
  }
}