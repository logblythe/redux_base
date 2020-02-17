import 'package:github_search/actions/search_actions.dart';
import 'package:github_search/state/search_state.dart';
import 'package:redux/redux.dart';

/// Reducer
final searchReducer = combineReducers<SearchState>([
  TypedReducer<SearchState, SearchLoadingAction>(_onLoad),
  TypedReducer<SearchState, SearchErrorAction>(_onError),
  TypedReducer<SearchState, SearchResultAction>(_onResult),
]);

SearchState _onLoad(SearchState state, SearchLoadingAction action) =>
    SearchLoading();

SearchState _onError(SearchState state, SearchErrorAction action) =>
    SearchError();

SearchState _onResult(SearchState state, SearchResultAction action) =>
    action.result.items.isEmpty
        ? SearchEmpty()
        : SearchPopulated(action.result);
