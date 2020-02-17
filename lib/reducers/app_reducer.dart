import 'package:github_search/reducers/search_reducer.dart';
import 'package:github_search/reducers/user_reducer.dart';
import 'package:github_search/state/app_state.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    userState: userReducer(state.userState, action),
    searchState: searchReducer(state.searchState, action),
  );
}
