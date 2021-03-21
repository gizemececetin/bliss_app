import 'package:cloud_firestore/cloud_firestore.dart';

class AvatarModel {
  String name;
  String avatarUrl;
  bool show;
  AvatarModel(this.name, this.avatarUrl, this.show);

  AvatarModel.fromSnapshot(DocumentSnapshot snapshot){
    avatarUrl = snapshot["avatar_url"];
    name = snapshot["user_name"];
    show = true;

  }
}
