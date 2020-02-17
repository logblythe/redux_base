import 'dart:async';

import 'package:async/async.dart';
import 'package:github_search/github_client.dart';

class SearchService {
  final GithubClient api = GithubClient();
  Timer _timer;
  CancelableOperation _operation;

  Future<SearchResult> search(String term) => api.search(term);

  Future<SearchResult> searchs(String term) async {
    _timer?.cancel();
    await _operation?.cancel();
    _timer = await Timer(Duration(milliseconds: 250), () {
      _operation = CancelableOperation.fromFuture(api.search(term));
    });
    return _operation.value;
  }
}
