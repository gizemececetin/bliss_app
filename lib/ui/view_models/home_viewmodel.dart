import 'dart:math';
import 'package:blissemojiapp/core/locator.dart';
import 'package:blissemojiapp/core/services/firebase_service.dart';
import 'package:blissemojiapp/core/services/github_service.dart';
import 'package:blissemojiapp/ui/view_models/base_viewmodel.dart';
import 'package:blissemojiapp/ui/views/avatar_list.dart';
import 'package:blissemojiapp/ui/views/emoji_list.dart';
import 'package:blissemojiapp/ui/views/google_repos_list.dart';

class HomeViewModel extends BaseViewModel {
  final GithubService _githubService = getIt<GithubService>();
  final FirebaseService _firebaseService = getIt<FirebaseService>();
  List emojis;



  showEmojis() async {
    emojis = await _githubService.getEmojis();
    return await navigatorService.navigateTo(EmojiList(emojiList: emojis,));
  }
  getRandomEmoji() async {
    if(emojis == null)
    emojis = await _githubService.getEmojis();
    int randomNumber = Random.secure().nextInt(emojis.length);

    return emojis[randomNumber].emojiUrl;
  }
  getAndSaveAvatar(String userName) async {
    String avatarUrl = await _githubService.getAvatar(userName);
    await _firebaseService.addAvatar(avatarUrl, userName);
    return avatarUrl;
  }

  showAllAvatars() async {
    List avatars =  await _firebaseService.getAvatars();
    return await navigatorService.navigateTo(AvatarList(avatarList: avatars));
  }
  showGoogleRepos() async {
    var googleRepos = await _githubService.getGoogleRepos();
    return await navigatorService.navigateTo(GoogleReposList(googleReposList: googleRepos,));
  }
}
