import 'package:github_search/github_client.dart';

abstract class SearchState {}

class SearchInitial implements SearchState {}

class SearchLoading implements SearchState {}

class SearchEmpty implements SearchState {}

class SearchPopulated implements SearchState {
  final SearchResult result;

  SearchPopulated(this.result);
}

class SearchError implements SearchState {}