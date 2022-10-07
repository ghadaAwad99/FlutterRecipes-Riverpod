import 'package:flutter/material.dart';
import 'package:recipes_app/data/remote/recipes/models/recipes_response_entity.dart';
import 'package:recipes_app/utils/app_colors.dart';
import 'package:recipes_app/utils/images.dart';
import 'package:recipes_app/utils/network/end_points.dart';
import 'package:recipes_app/utils/string_extension.dart';

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
            padding: const EdgeInsets.all(20.0),
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

class IngredientsWidget extends StatelessWidget {
  const IngredientsWidget({
    Key? key,
    required this.ingredients,
  }) : super(key: key);

  final List<ExtendedIngredient> ingredients;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6),
      child: ListView.builder(
          itemCount: ingredients.length,
        itemBuilder: (context, index) =>
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                        height: 60,
                        width: 60,
                        child: ingredients[index].image != null 
                            ? Image.network(EndPoints.imageUrl + (ingredients[index].image!)) 
                            : Image.asset(placeholder)
                    ),
                  ),
                  Spacer(),
                  Expanded(
                    flex: 2,
                    child: Text(
                      ingredients[index].name?.capitalize() ?? "",
                      style: TextStyle(fontSize: 16, color: Colors.grey.shade600,),
                    ),
                  ),
                  Spacer(),
                  Expanded(
                    flex: 1,
                      child: Text(
                        "${ingredients[index].amount}  ${ingredients[index].unit}",
                        style: TextStyle(fontSize: 13),
                      )
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}

class PhotoHeader extends StatelessWidget {
  const PhotoHeader({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomStart,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(recipe.image ?? "",)
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            height: 35,
            width: 90,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.access_time_filled,
                    color: AppColors.green,
                    size: 18,
                  ),
                  const SizedBox(width: 6,),
                  Text("${recipe.readyInMinutes} min")
                ],
              ),
            ),
          ),
        ),
        Positioned(
          left: 15,
          top: 25,
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
              },
            icon: Icon(Icons.arrow_back_ios, color: Colors.white,)),
        ),
      ],
    );
  }
}

class InstructionsWidget extends StatelessWidget {
  const InstructionsWidget({
    Key? key,
    required this.instructions,
  }) : super(key: key);
  final List<AnalyzedInstruction> instructions;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6),
        child: ListView.builder(
            itemCount: instructions[0].steps?.length,
            itemBuilder: (context, index) => Card(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text("Step ${
                          instructions[0]
                              .steps?[index].number
                              .toString()
                      }",
                        style: TextStyle(color: AppColors.green),),
                      const SizedBox(height: 8,),
                      Text(instructions[0].steps?[index].step ?? ""),
                    ],
                  )
              ),
            )
        )
    );
  }
}
