import 'package:github_search/actions/login_actions.dart';
import 'package:github_search/models/login_response.dart';
import 'package:github_search/state/app_state.dart';
import 'package:redux/redux.dart';

class LoginViewModel {
  final bool isLoading;
  final bool loginError;
  final LoginResponse user;

  final Function(String, String) login;

  LoginViewModel({
    this.isLoading,
    this.loginError,
    this.user,
    this.login,
  });

  static LoginViewModel fromStore(Store<AppState> store) {
    return LoginViewModel(
      isLoading: store.state.userState.isLoading,
      loginError: store.state.userState.loginError,
      user: store.state.userState.user,
      login: (String username, String password) {
        store.dispatch(loginUser(username, password));
//        store.dispatch(LoginAction());
      },
    );
  }
}
