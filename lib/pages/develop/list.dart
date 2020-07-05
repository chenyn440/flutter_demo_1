import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // 包含一个简单的JSON编码器和解码器
import '../../model/chat.dart';

class ListPage extends StatefulWidget {
  @override
  ListStatus createState() => new ListStatus();
}

class ListStatus extends State<ListPage> {
  var array = {};
  var obj = [];

  Future<List<Chat>> fetchPost() async{
    final response = await http.get('http://rap2api.taobao.org/app/mock/225870/api/chat/list');
    if (response.statusCode == 200){
      //获取响应数据，并且转换成Map类型
      final responseBody = json.decode(response.body);
      //转换模型数组
      List<Chat> chatList = responseBody['chat_list']
          .map<Chat>((item) => Chat.fromJson(item))
          .toList();
      return chatList;
    }else {
      throw Exception('statusCode:${response.statusCode}');
    }
  }

  @override
  void initState() {
    //页面初始化
    super.initState();
    // fetchPost();
  }

  @override
  void dispose() {
    //页面销毁时
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: fetchPost(),
        builder: (BuildContext context, AsyncSnapshot snapShot){
          print('data:${snapShot.data}');
          return ListView(
            scrollDirection: Axis.vertical,
            children: snapShot.data.map<Widget>(
                (item){
                  return ListTile(
                    title: Text(item.name),
                    subtitle: Container(
                      height: 20,
                      width: 20,
                      child: Text(
                        item.message,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    leading: CircleAvatar(
                        backgroundImage: NetworkImage(item.imageUrl),
                    ),
                  );
                }
            ).toList(),
          );
        },
      ),
    );
  }
}