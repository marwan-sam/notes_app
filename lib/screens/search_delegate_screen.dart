import 'package:flutter/material.dart';

import 'widgets/search_results_body.dart';

class SearchDelegateView extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.close)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return SearchResultsBody(query: query.toLowerCase());
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return SearchResultsBody(
      query: query.toLowerCase(),
    );
  }
}
