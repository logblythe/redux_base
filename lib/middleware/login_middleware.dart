import 'package:github_search/actions/login_actions.dart';
import 'package:github_search/models/login_response.dart';
import 'package:github_search/state/app_state.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

class LoginEpic implements EpicClass<AppState> {
  @override
  Stream call(Stream actions, EpicStore<AppState> store) {
    return Observable(actions)
        .ofType(TypeToken<LoginAction>())
        .switchMap((action) => _login());
  }

  Stream _login() async* {
    yield StartLoadingAction();
    try {
      yield LoginSuccessAction(await login('username', 'username'));
    } catch (e) {
      yield LoginFailedAction();
    }
  }
}

Future<LoginResponse> login(String username, String password) async {
  return Future.delayed(
    const Duration(milliseconds: 2000),
    () {
      if (username.isEmpty || password.isEmpty) {
        var error = Error();
        return Future.error(error);
      } else {
        var response = LoginResponse(userId: 0, userName: 'Redux example');
        return response;
      }
    },
  );
}
