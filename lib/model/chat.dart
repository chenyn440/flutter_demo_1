class Chat {
  final String name;
  final String message;
  final String imageUrl;
  Chat({this.name, this.message, this.imageUrl});
  //类似于initWithJson
  factory Chat.fromJson(Map json) {
    return Chat(
      name: json['name'],
      message: json['message'],
      imageUrl: json['imageUrl'],
    );
  }
}