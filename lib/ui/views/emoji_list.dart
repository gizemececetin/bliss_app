import 'package:blissemojiapp/core/models/emoji_model.dart';
import 'package:blissemojiapp/ui/shared/uicolor.dart';
import 'package:blissemojiapp/ui/view_models/home_viewmodel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmojiList extends StatelessWidget {
  final List<EmojiModel> emojiList;

  const EmojiList({Key key, this.emojiList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    return Consumer<HomeViewModel>(
      builder: (BuildContext context, HomeViewModel model, Widget child) =>
          Scaffold(
            appBar: AppBar(
              backgroundColor: UIColor.colorSecondaryShade,
              title: Text("Emoji List"),
            ),
            backgroundColor: UIColor.colorSecondaryTint,
              body: ListView.builder(
                itemBuilder: (context, indexHorizontal) {
                  return Container(
                    height: _screenHeight/8.5,
                    width: _screenWidth/6,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      //padding: EdgeInsets.all(10),
                      itemBuilder: (context, indexVertical) {
                        return Padding(
                          padding: EdgeInsets.all(8),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white54,
                            ),
                            child: CachedNetworkImage(
                              imageUrl: emojiList[indexHorizontal == 0 ? indexVertical: indexVertical+(indexHorizontal*4)].emojiUrl,
                              placeholder: (context, url) => Container( child: Center(child: CircularProgressIndicator()),),
                              fit: BoxFit.fill,
                              width: _screenWidth/5,
                              height: _screenHeight/20,
                            ),
                          ),
                        );
                      },
                      itemCount: 4,
                    ),
                  );
                },
                itemCount: emojiList.length,
              ),
          ),
    );
  }
}
