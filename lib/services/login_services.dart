import 'package:github_search/models/login_response.dart';

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
