import 'package:blissemojiapp/core/models/avatar_model.dart';
import 'package:blissemojiapp/ui/shared/uicolor.dart';
import 'package:blissemojiapp/ui/view_models/home_viewmodel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AvatarList extends StatefulWidget {
  final List<AvatarModel> avatarList;

  const AvatarList({Key key, this.avatarList}) : super(key: key);

  @override
  _AvatarListState createState() => _AvatarListState();
}

class _AvatarListState extends State<AvatarList> {

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery
        .of(context)
        .size
        .width;
     return Consumer<HomeViewModel>(
      builder: (BuildContext context, HomeViewModel model, Widget child) =>
          Scaffold(
              appBar: AppBar(
                backgroundColor: UIColor.colorPrimaryShade,
                title: Text("Avatar List"),
              ),
              backgroundColor: UIColor.colorPrimaryTint,
              body: Padding(
                padding: const EdgeInsets.only(right: 60, left: 60),
                child: Container(
                  width: _screenWidth /1.5,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.all(8),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              widget.avatarList[index].show = !widget.avatarList[index].show;
                            });
                          },
                          child: Container(

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Stack(
                              children: [

                                CachedNetworkImage(
                                  imageUrl: widget.avatarList[index]
                                      .avatarUrl,
                                  placeholder: (context, url) =>
                                      Container(child: Center(
                                          child: CircularProgressIndicator()),),
                                  fit: BoxFit.fill,
                                ),
                                !widget.avatarList[index].show ?
                                Container(color: Colors.white54 ,child: Align(alignment: Alignment.bottomCenter,child: Text(widget.avatarList[index].name),)):
                                    SizedBox()

                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: widget.avatarList.length,
                  ),
                ),
              )

          ),
    );
  }
}
