import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes_app/presentation/home/home_state.dart';
import 'package:recipes_app/presentation/home/home_viewModel.dart';
import 'package:recipes_app/presentation/recipe_details/recipe_details_screen.dart';
import 'package:recipes_app/utils/app_colors.dart';

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
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: Icon(
            Icons.search,
            color: AppColors.green,
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Column(
            children: [
              RichText(
                text: TextSpan(
                    text: "GOOD",
                    style: TextStyle(color: AppColors.green, fontSize: 25),
                    children: const [
                      TextSpan(
                          text: "MEAL", style: TextStyle(color: Colors.black)),
                    ]),
              ),
              Text(
                "Food Recipes",
                style: TextStyle(color: Colors.grey.shade400, fontSize: 13),
              )
            ],
          ),
        ),
        body: state.isSuggestedRecipesLoading
            ? Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Suggested Recipes",
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 500,
                      height: 200,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>
                            buildRecipeCard(state, index),
                        itemCount: state.recipes?.length,
                      ),
                    )
                  ],
                ),
              )
    );
  }

  Widget buildRecipeCard(HomeState state, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RecipeDetailsScreen.tag);
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: Colors.grey.shade100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 150,
              height: 200,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    state.recipes?[index].image ?? "",
                    fit: BoxFit.cover,
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: SizedBox(
                          width: 150,
                          child: Text(
                            state.recipes?[index].title ?? "",
                            style: TextStyle(fontSize: 20),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          )
                      )
                  ),
                  Expanded(
                      child: SizedBox(
                          width: 150,
                          child: Text(
                            state.recipes?[index].summary ?? "",
                            style: TextStyle(fontSize: 13),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 4,
                          )
                      )
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}