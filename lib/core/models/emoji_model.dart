class EmojiModel {
  String name;
  String emojiUrl;
  EmojiModel(this.name, this.emojiUrl);

  EmojiModel.fromJson(Map json) {
    json.forEach((key, value) {
      print("key: $key" );
      print("value: $value" );
      name = key;
      emojiUrl = value;
    });


  }
}
