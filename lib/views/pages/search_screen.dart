import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:github_search/actions/search_actions.dart';
import 'package:github_search/search_empty_view.dart';
import 'package:github_search/search_error_view.dart';
import 'package:github_search/search_initial_view.dart';
import 'package:github_search/search_loading_view.dart';
import 'package:github_search/search_result_view.dart';
import 'package:github_search/state/app_state.dart';
import 'package:github_search/state/search_state.dart';
import 'package:github_search/view_models/search_view_model.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SearchScreenViewModel>(
      converter: (store) {
        return SearchScreenViewModel(
          state: store.state.searchState,
          onTextChanged: (term) {
            store.dispatch(search(term));
          },
        );
      },
      builder: (BuildContext context, SearchScreenViewModel vm) {
        return Scaffold(
          body: Flex(direction: Axis.vertical, children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 4.0),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search Github...',
                ),
                style: TextStyle(
                  fontSize: 36.0,
                  fontFamily: "Hind",
                  decoration: TextDecoration.none,
                ),
                onChanged: vm.onTextChanged,
              ),
            ),
            Expanded(
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 500),
                child: _buildVisible(vm.state),
              ),
            )
          ]),
        );
      },
    );
  }

  Widget _buildVisible(SearchState state) {
    if (state is SearchLoading) {
      return SearchLoadingView();
    } else if (state is SearchEmpty) {
      return SearchEmptyView();
    } else if (state is SearchPopulated) {
      return SearchPopulatedView(state.result);
    } else if (state is SearchInitial) {
      return SearchInitialView();
    } else if (state is SearchError) {
      return SearchErrorWidget();
    }

    throw ArgumentError('No view for state: $state');
  }
}
