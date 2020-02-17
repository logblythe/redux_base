import 'package:flutter/material.dart';
import 'package:github_search/state/search_state.dart';
import 'package:github_search/state/user_state.dart';

@immutable
class AppState {
  final UserState userState;
  final SearchState searchState;

  AppState({@required this.userState, @required this.searchState});

  factory AppState.initial() {
    return AppState(
      userState: UserState.initial(),
      searchState: SearchInitial(),
    );
  }

  AppState copyWith({
    UserState userState,
    SearchState searchState,
  }) {
    return AppState(
      userState: userState ?? this.userState,
      searchState: searchState ?? this.searchState,
    );
  }

  @override
  int get hashCode =>
      //isLoading.hash Code ^
      userState.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          userState == other.userState &&
          searchState == other.searchState;
}
