import 'package:blissemojiapp/core/locator.dart';
import 'package:blissemojiapp/ui/shared/uicolor.dart';
import 'package:blissemojiapp/ui/view_models/home_viewmodel.dart';
import 'package:blissemojiapp/ui/widgets/inkwell_custom_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _userNameController = TextEditingController();

  var randomEmojiUrl= "".obs;

  Future<void> getRandomEmoji(HomeViewModel model) async {
    var randomEmoji = await model.getRandomEmoji();
    randomEmojiUrl.value = randomEmoji;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (BuildContext context) => getIt<HomeViewModel>(),
      child: Consumer<HomeViewModel>(
        builder: (BuildContext context, HomeViewModel model, Widget child) =>
            Scaffold(
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  height: size.height,
                  width: size.width,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [UIColor.colorPrimaryShade, UIColor.colorSecondaryShade])),
                ),
                Container(
                  height: size.height,
                  width: size.width,
                  padding: EdgeInsets.all(8),
                  child: model.busy
                      ? Center(child: CircularProgressIndicator())
                      : Center(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Obx(() =>randomEmojiUrl.value != ""
                                        ? CachedNetworkImage(
                                            imageUrl: randomEmojiUrl.value,
                                            placeholder: (context, url) =>
                                                Container(
                                              color: Colors.transparent,
                                              child: Center(
                                                  child:
                                                      CircularProgressIndicator()),
                                            ),
                                            fit: BoxFit.contain,
                                            width: size.width / 4,
                                            height: size.height / 10,
                                          )
                                        : Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.white30,
                                            ),
                                            child: Text("NO IMAGE SELECTED")),),
                                    SizedBox(
                                      height: size.height * 0.08,
                                    ),
                                    InkwellCustomButton(
                                      onPressed: () async =>
                                          await getRandomEmoji(model),
                                      buttonText: "Random Emoji",
                                    ),
                                    SizedBox(
                                      height: size.height * 0.02,
                                    ),
                                    InkwellCustomButton(
                                      onPressed: () async =>
                                          await model.showEmojis(),
                                      buttonText: "Emoji List",
                                    ),
                                    SizedBox(
                                      height: size.height * 0.08,
                                    ),
                                    Row(
                                      children: [
                                        Flexible(
                                          flex: 3,
                                          child: TextField(
                                              controller: _userNameController,
                                              style: TextStyle(
                                                  color: UIColor.colorLight,
                                                  fontFamily:
                                                      "Quicksand-SemiBold"),
                                              cursorColor: UIColor.colorLight,
                                              keyboardType:
                                                  TextInputType.emailAddress,
                                              decoration: InputDecoration(
                                                hintText:
                                                    'Enter the name of user',
                                                prefixText: '  ',
                                                hintStyle: TextStyle(
                                                    color: UIColor.colorLight,
                                                    fontFamily:
                                                        "Quicksand-Light"),
                                                focusColor:
                                                    UIColor.colorLightTint,
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: UIColor
                                                                .colorLightTint)),
                                                enabledBorder: UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: UIColor
                                                            .colorSecondaryShade)),
                                              )),
                                        ),
                                        IconButton(
                                          color: UIColor.colorSecondaryShade,
                                            icon: Icon(Icons.search),
                                            onPressed: () async {
                                              var avatar =
                                                  await model.getAndSaveAvatar(
                                                      _userNameController.text);
                                              setState(() {
                                                randomEmojiUrl.value = avatar;
                                              });
                                            })
                                      ],
                                    ),
                                    SizedBox(
                                      height: size.height * 0.04,
                                    ),
                                    InkwellCustomButton(
                                      onPressed: () async =>
                                          await model.showAllAvatars(),
                                      buttonText: "Avatar List",
                                    ),
                                    SizedBox(
                                      height: size.height * 0.02,
                                    ),
                                    InkwellCustomButton(
                                      onPressed: () async =>
                                          await model.showGoogleRepos(),
                                      buttonText: "Google Repos",
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
