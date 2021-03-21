import 'package:blissemojiapp/ui/shared/uicolor.dart';
import 'package:blissemojiapp/ui/view_models/home_viewmodel.dart';
import 'package:blissemojiapp/ui/views/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/locator.dart';
import 'core/services/navigator_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocators();

  runApp(EmojiApp());
}

class EmojiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => getIt<HomeViewModel>(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bliss App',
        navigatorKey: getIt<NavigatorService>().navigatorKey,
        theme: ThemeData(
          fontFamily: "QuickSand-Medium",
          primaryColor: UIColor.colorPrimaryShade,
          accentColor: UIColor.colorPrimary,
        ),
        home:
          HomePage() ,
        ),

    );
  }
}
