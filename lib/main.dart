import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:github_search/github_client.dart';
import 'package:github_search/navigation/navigation_service.dart';
import 'package:github_search/navigation/router.dart';
import 'package:github_search/reducers/app_reducer.dart';
import 'package:github_search/redux.dart';
import 'package:github_search/state/app_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:redux_thunk/redux_thunk.dart';

import 'middleware/login_middleware.dart';

void main() {
  /*final store = Store<SearchState>(
    searchReducer,
    initialState: SearchInitial(),
    middleware: [
      // The following middleware both achieve the same goal: Load search
      // results from github in response to SearchActions.
      //
      // One is implemented as a normal middleware, the other is implemented as
      // an epic for demonstration purposes.

      SearchMiddleware(GithubClient()),
//      EpicMiddleware<SearchState>(SearchEpic(GithubClient())),
    ],
  );*/

  /*runApp(RxDartGithubSearchApp(
    store: store,
  ));*/

  var searchEpic = EpicMiddleware<AppState>(SearchEpic(GithubClient()));
  var loginEpic = EpicMiddleware<AppState>(LoginEpic());
  final store = Store<AppState>(
    appReducer,
    initialState: AppState.initial(),
    middleware: [thunkMiddleware],
    syncStream: true
  );

  runApp(MyApp(store: store));
}
//
//class RxDartGithubSearchApp extends StatelessWidget {
//  final Store<SearchState> store;
//
//  RxDartGithubSearchApp({Key key, this.store}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return StoreProvider<SearchState>(
//      store: store,
//      child: MaterialApp(
//        title: 'RxDart Github Search',
//        theme: ThemeData(
//          brightness: Brightness.dark,
//          primarySwatch: Colors.grey,
//        ),
//        home: SearchScreen(),
//      ),
//    );
//  }
//}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  MyApp({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'RxDart Github Search',
        navigatorKey: navigatorKey,
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.grey,
        ),
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}
