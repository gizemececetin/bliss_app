import 'package:blissemojiapp/core/models/avatar_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  var refAvatars = FirebaseFirestore.instance.collection('Avatars');

  addAvatar(String avatarUrl, String userName){
    refAvatars.add({"avatar_url": avatarUrl, "user_name" : userName});
  }

  Future getAvatars() async{
    return refAvatars.get().then((value) {
      if(value.docs.isNotEmpty){
        var avatarsList = value.docs;
        List<AvatarModel> avatars = avatarsList.map((e) => AvatarModel.fromSnapshot(e)).toList();
        print("Avatars : ${avatars[0].name}");
        return avatars;
      }
    });
  }

}
