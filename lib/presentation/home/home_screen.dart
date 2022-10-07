import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes_app/presentation/home/home_state.dart';
import 'package:recipes_app/presentation/home/home_viewModel.dart';

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
      appBar: AppBar(
        title: const Text("Recipes App"),
      ),
      body: Center(
        child:
          Text("${state.recipes?.length}"),
      )
    );
  }
}
