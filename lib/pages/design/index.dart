import 'package:flutter/material.dart';
import '../common/menu.dart';

/*
首页是带一个根据点击弹出菜单而改变中间文字的可变状态控件
 */
class Design extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MenuDesignPageState();
  }
}

class MenuDesignPageState extends State<Design> {
  bool menuStatus = false;
  Widget defineBody = ListView(
    shrinkWrap: true,
    scrollDirection: Axis.vertical,
    children: [
      Container(
        color: Color.fromRGBO(0, 0, 0, 1),
        padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: Column(
          children: [
            SizedBox(height: 30),
            Image.asset(
              'assets/images/design-logo.png',
              // fit: BoxFit.cover,
              width: 128,
            ),
            SizedBox(height: 30),
            Text(
              'SF符号介绍',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(255, 255, 255, 1)
              ),
            ),
            SizedBox(height: 30),
            Text(
              'SF Symbols拥有1,500多个可配置符号，旨在与Apple平台的系统字体San Francisco无缝集成。SF Symbols具有广泛的权重和刻度，可以自动与文本标签对齐，并支持动态类型和粗体文本可访问性功能。您还可以设计具有相同设计特征和可访问性功能的自定义符号。',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                color: Color.fromRGBO(255, 255, 255, 1),
              ),
            ),
            SizedBox(height: 20),
            Text(
              '学到更多',
              style: TextStyle(
                color: Color.fromRGBO(102,187,255, 1),
                fontSize: 20.0
              )
            ),
            SizedBox(height: 10),
            Text(
              '下载SF符号',
              style: TextStyle(
                color: Color.fromRGBO(102,187,255, 1),
                fontSize: 20.0
              )
            ),
            SizedBox(height: 10),
            Text(
              '需要macOS 10.14.4或更高版本',
              style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
                fontSize: 20.0
              )
            ),
            SizedBox(height: 30),
          ]
        ),
        alignment: Alignment.center, 
      ),
      Container(
        margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
        padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color.fromRGBO(57,159,213, 1), Color.fromRGBO(9,131,255, 1)],
          ),
        ),
        child: Column(
          children: [
            Image.asset(
              'assets/images/design-ct-01.png',
              fit: BoxFit.cover,
            ),
            SizedBox(height: 30),
            Text(
              '人机界面准则',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
                fontSize: 34.0,
                fontWeight: FontWeight.bold,
              )
            ),
            SizedBox(height: 30),
            Text(
              '获取有关设计与Apple平台无缝集成的出色应用程序的深入信息和UI资源。',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
                fontSize: 24.0
              )
            ),
            SizedBox(height: 20),
            Text(
              '阅读人机界面指南',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
                fontSize: 20.0
              )
            ),
            SizedBox(height: 10),
            Text(
              '查看设计资源',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
                fontSize: 20.0
              )
            ),
          ],
        )
      ),
      Stack(
        children: [
          Container(
            child: Image.asset(
              'assets/images/design-ct-02.jpg',
              fit: BoxFit.fitHeight,
              height: 680,
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
            padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
            child: Column(
              children: [
                SizedBox(height: 320),
                Text(
                  '苹果设计奖',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontSize: 26.0,
                    fontWeight: FontWeight.bold,
                  )
                ),
                SizedBox(height: 20),
                Text(
                  '宣布今年的获奖者',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontSize: 34.0,
                    fontWeight: FontWeight.bold,
                  )
                ),
                SizedBox(height: 30),
                Text(
                  '探索2019年获奖的应用程序，这些应用程序反映了Apple平台上最好的设计，创新和技术。',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontSize: 24.0
                  )
                ),
                SizedBox(height: 20),
                Text(
                  '见赢家',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromRGBO(102,187,255, 1),
                    fontSize: 20.0
                  )
                ),
              ],
            )

          )
        ]
      )
      
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
            centerTitle: true,
            elevation: 0,
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