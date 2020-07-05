import 'dart:async';
import 'dart:convert';
 
// import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
 
//发起网络请求
Future<Post> fetchPost() async{
  final response = await http.get('https://jsonplaceholder.typicode.com/posts/1');
  final responseJson = json.decode(response.body);
  return Post.fromJson(responseJson);
}
//将返回的内容转换为Dart 对象
class Post{
  final int userId;
  final int id;
  final String title;
  final String body;
 
  Post({this.userId,this.id,this.title,this.body});
 
  factory Post.fromJson(Map<String, dynamic> json){
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}