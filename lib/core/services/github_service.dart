import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:blissemojiapp/core/models/emoji_model.dart';

class GithubService {
  var githubEmojiUrl = Uri.parse("https://api.github.com/emojis");
  var googleReposUrl = Uri.parse("https://api.github.com/users/google/repos");
  List<EmojiModel> emojiList = [];
  List<String> googleReposList = [];

  Future<List> getEmojis() async {
    final response = await http.get(githubEmojiUrl);
    print("HttpStatus: waiting");

    switch (response.statusCode) {
      case HttpStatus.ok:
        print("HttpStatus: OK");
        final jsonBody = jsonDecode(response.body);

        jsonBody.forEach((key, value) {
          emojiList.add(EmojiModel(key, value));
        });
        return emojiList;

        break;
      default:
    }
  }

  Future<String> getAvatar(userName) async {
    print( "username: $userName");
    var githubUsers = "https://api.github.com/users/" + userName;
    var githubUsersUrl = Uri.parse(githubUsers);

    final response = await http.get(githubUsersUrl);
    print("HttpStatus: waiting");

    switch (response.statusCode) {
      case HttpStatus.ok:
        print("HttpStatus: OK");
        final jsonBody = jsonDecode(response.body);

        print("url: ${jsonBody["avatar_url"]}");
        return jsonBody["avatar_url"];


        break;
      default:
    }
  }
  Future<List> getGoogleRepos() async {

    final response = await http.get(googleReposUrl);
    print("HttpStatus: waiting");
    switch (response.statusCode) {
      case HttpStatus.ok:
        print("HttpStatus: OK");
        final jsonBody = jsonDecode(response.body);
        print("goog $jsonBody");

        jsonBody.forEach((value) {
          print("goog ${value["full_name"]}");

          googleReposList.add(value["full_name"]);
        });
        return googleReposList;

        break;
      default:
    }
  }

}
