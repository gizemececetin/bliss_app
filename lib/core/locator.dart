import 'package:blissemojiapp/core/services/firebase_service.dart';
import 'package:blissemojiapp/core/services/github_service.dart';
import 'package:blissemojiapp/core/services/navigator_service.dart';
import 'package:blissemojiapp/ui/view_models/home_viewmodel.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

setupLocators() {
  getIt.registerLazySingleton(() => NavigatorService());
  getIt.registerLazySingleton(() => GithubService());
  getIt.registerLazySingleton(() => FirebaseService());


  getIt.registerFactory(() => HomeViewModel());

}
