import 'package:github_search/models/login_response.dart';
import 'package:github_search/navigation/navigation_service.dart';
import 'package:github_search/navigation/route_paths.dart';
import 'package:github_search/services/login_services.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

ThunkAction loginUser(String username, String password) {
  return (Store store) async {
    store.dispatch(StartLoadingAction());
    await login(username, password).then((loginResponse) {
      store.dispatch(LoginSuccessAction(loginResponse));
      navigatorKey.currentState.pushNamed(RoutePaths.Home);
    }, onError: (error) {
      store.dispatch(LoginFailedAction());
    });
  };
}

class LoginAction {}

class StartLoadingAction {
  StartLoadingAction();
}

class LoginSuccessAction {
  final LoginResponse user;

  LoginSuccessAction(this.user);
}

class LoginFailedAction {
  LoginFailedAction();
}
