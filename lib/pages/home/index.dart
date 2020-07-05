import 'package:flutter/material.dart';
import './bar.dart';
import './found.dart';
import './vision.dart';
import '../common/menu.dart';

/*
首页是带一个根据点击弹出菜单而改变中间文字的可变状态控件
 */
class Home extends StatefulWidget {
  
  // State<StatefulWidget> createState() {
  //   return new MenuHomePageState();
  // }
  @override
  MenuHomePageState createState() => new MenuHomePageState();
}

class MenuHomePageState extends State<Home> {
  bool menuStatus = false;
  Widget defineBody = ListView(
    shrinkWrap: true,
    scrollDirection: Axis.vertical,
    children: [
      Bar(),
      Container(
        child: Image.asset(
          'assets/images/banner.jpg',
          fit: BoxFit.cover,
        )
      ),
      Found(),
      Vision()
    ]
  );
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
                    'Developer',
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
          body: defineBody
        ),
        menuStatus ? Menu(menuStatus: menuStatus, callback: (value)=> onChanged(value)) : Text('')
      ]
    );
  }
}