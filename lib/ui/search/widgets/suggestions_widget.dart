import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes_app/ui/home/home_state.dart';
import 'package:recipes_app/ui/home/home_viewModel.dart';

class SuggestionsWidget extends ConsumerStatefulWidget {
  final Function(int) onTap;
  final String query;

  const SuggestionsWidget({Key? key, required this.onTap, required this.query})
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
        : (state.suggestionsList!.isEmpty && widget.query != '')
            ? NoResultsWidget(query: widget.query)
            : ListView.builder(
                itemCount: state.suggestionsList?.length,
                itemBuilder: (context, index) {
                  var result = state.suggestionsList?[index];
                  return GestureDetector(
                    onTap: () {
                      widget.onTap(result?.id ?? 0);
                    },
                    child: ListTile(
                      title: Text(result?.title ?? ""),
                    ),
                  );
                },
              );
  }
}

class NoResultsWidget extends StatelessWidget {
  const NoResultsWidget({
    Key? key,
    required this.query,
  }) : super(key: key);

  final String query;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search_off,
              size: 250, color: Colors.grey.shade300),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "No results for your search \'$query\'",
              textAlign: TextAlign.center,
              style:
                  TextStyle(color: Colors.grey.shade400, fontSize: 16),
            ),
          )),
        ],
      ));
  }
}
