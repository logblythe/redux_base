import 'dart:async';

import 'package:github_search/github_client.dart';
import 'package:github_search/services/search_services.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

/// Actions

ThunkAction search(String term) {
  return (Store store) async {
    await Future(() async {
      store.dispatch(SearchLoadingAction());
      await SearchService().search(term).then((value) {
        store.dispatch(SearchResultAction(value));
      }, onError: (error) {
        store.dispatch(SearchErrorAction());
      });
    });
  };
}

class SearchAction {
  final String term;

  SearchAction(this.term);
}

class SearchLoadingAction {}

class SearchErrorAction {}

class SearchResultAction {
  final SearchResult result;

  SearchResultAction(this.result);
}
