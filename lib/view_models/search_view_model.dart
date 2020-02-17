import 'package:github_search/state/search_state.dart';

class SearchScreenViewModel {
  final SearchState state;

  final void Function(String term) onTextChanged;

  SearchScreenViewModel({this.state, this.onTextChanged});
}
