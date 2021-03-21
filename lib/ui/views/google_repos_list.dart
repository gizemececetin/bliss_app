import 'package:blissemojiapp/ui/shared/uicolor.dart';
import 'package:flutter/material.dart';
class GoogleReposList extends StatelessWidget {
  final List googleReposList;

  const GoogleReposList({Key key, this.googleReposList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          backgroundColor:  UIColor.colorPrimaryShade,
          title: Text("Google Repos List"),
        ),
        backgroundColor: UIColor.colorLightShade,
        body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(8),
              child: Stack(
                children: [

                  Container(color: Colors.white30 ,child: Center(child: Text(googleReposList[index]),))

                ],
              ),
            );
          },
          itemCount: googleReposList.length,
        )

    );
  }
}
