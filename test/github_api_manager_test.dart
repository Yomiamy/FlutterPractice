import 'package:flutter_practice/homework/github_client/api/github_api_manager.dart';
import 'package:flutter_practice/homework/github_client/models/repo.dart';
import 'package:flutter_practice/homework/github_client/models/user.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Github_API_Manager_Test", () {
    late GithubApiManager apiManager;

    setUp(() {
        apiManager = GithubApiManager.instance;
        apiManager.init();
    });

    test("Login Flow", () async {
      User? user = await apiManager.login(account: "Yomiamy", passwd: "yomiamy0330");

      expect(user, isNotNull);
      expect(user?.id, greaterThan(0));
    });

    test("Get repos", () async {
      List<Repo>? repos = await apiManager.getRepos(queryParams: {});

      expect(repos, isNotNull);
      expect(repos?.length, greaterThan(0));
    });
  });
}