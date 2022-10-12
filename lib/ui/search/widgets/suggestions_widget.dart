import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes_app/ui/home/home_state.dart';
import 'package:recipes_app/ui/home/home_viewModel.dart';

class SuggestionsWidget extends ConsumerStatefulWidget {
  final Function() onTap;
  final String query;
  const SuggestionsWidget(
      {Key? key, required this.onTap, required this.query})
      : super(key: key);

  @override
  ConsumerState<SuggestionsWidget> createState() => _SuggestionsWidgetState();
}

class _SuggestionsWidgetState extends ConsumerState<SuggestionsWidget> {

  @override
  void initState() {
    print("inside SuggestionsWidget initState");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    HomeState state = ref.watch(homeViewModelProvider);
    return state.isSuggestionsLoading ?? true
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: state.suggestionsList?.length,
            itemBuilder: (context, index) {
              var result = state.suggestionsList?[index];
              return GestureDetector(
                onTap: () {
                  widget.onTap();
                },
                child: ListTile(
                  title: Text(result?.title ?? ""),
                ),
              );
            },
          );
  }
}
