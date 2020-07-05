import 'package:flutter/material.dart';
import '../common/menu.dart';
import './swiper.dart';
import './video.dart';

/*
首页是带一个根据点击弹出菜单而改变中间文字的可变状态控件
 */
class SupportPage extends StatefulWidget {
  
  // State<StatefulWidget> createState() {
  //   return new MenuSupportPagePageState();
  // }
  @override
  SupportPagePageState createState() => new SupportPagePageState();
}

class SupportPagePageState extends State<SupportPage> {
  bool menuStatus = false;
  void onChanged(val){
    setState(() {
      menuStatus = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            // 渐变
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color.fromRGBO(242, 242, 242, 1), Color.fromRGBO(209, 210, 211, 1)],
                ),
              ),
            ),
            leading: Builder(
              builder: (BuildContext context) {
                return new IconButton(
                  icon: ImageIcon(
                    AssetImage(
                      'assets/images/icon-show.jpg'
                    )
                  ),
                  onPressed: () {
                    setState(() {
                      menuStatus = true;
                    });
                  },
                  color: Color.fromRGBO(0, 0, 0, 1),
                  iconSize: 50.0
                );
            }),
            title: Container(
              margin: EdgeInsets.fromLTRB(50, 0, 0, 0),
              color: Color(0x000000),
              child: Row(
                children: <Widget>[
                  Image.asset(
                    'assets/images/logo-01.jpg',
                    height: 25.0,
                    fit: BoxFit.contain,
                    alignment: Alignment.center,
                  ),
                  SizedBox(width: 10),
                  Text(
                    '陈永暖',
                    style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontSize: 24.0
                    ),
                  )
                ]
              ),
              alignment: Alignment.center,
            )
          ),
          body: ListView(
            // padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            children: [
              SwiperPage(),
              SizedBox(height: 20),
              Text(
                '账号：chenyongnuan',
                style: TextStyle(
                  fontSize: 20.0
                ),
              ),
              SizedBox(height: 20),
               Text(
                '姓名：陈永暖',
                style: TextStyle(
                  fontSize: 20.0
                ),
              ),
              SizedBox(height: 20),
              VideoAppPage(),
              SizedBox(height: 20),
            ]
          )
        ),
        menuStatus ? Menu(menuStatus: menuStatus, callback: (value)=> onChanged(value)) : Text('')
      ]
    );
  }
}