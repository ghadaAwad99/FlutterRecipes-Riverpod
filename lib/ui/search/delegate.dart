import 'package:flutter/material.dart';
import 'package:recipes_app/ui/search/widgets/suggestions_widget.dart';

class CustomSearchDelegate extends SearchDelegate {
  final Function(String) onQueryChange;
  CustomSearchDelegate({required this.onQueryChange});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text("RESULTS");

  }

  @override
  Widget buildSuggestions(BuildContext context) {
    onQueryChange(query);
      return SuggestionsWidget(
        query: query,
          onTap: () {
        showResults(context);
      });
  }
}
