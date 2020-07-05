import 'package:flutter/material.dart';
import '../common/menu.dart';
/*
首页是带一个根据点击弹出菜单而改变中间文字的可变状态控件
 */
class CustomScrollViewPage extends StatefulWidget {
  
  // State<StatefulWidget> createState() {
  //   return new MenuCustomScrollViewPageState();
  // }
  @override
  CustomScrollViewPageState createState() => new CustomScrollViewPageState();
}

class CustomScrollViewPageState extends State<CustomScrollViewPage> {
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
          body:  CustomScrollView(
            slivers: <Widget>[
              //AppBar，包含一个导航栏
              SliverAppBar(
                pinned: true,
                expandedHeight: 250.0,
                flexibleSpace: FlexibleSpaceBar(
                  title: const Text('Demo'),
                  background: Image.asset(
                    "assets/images/icon-show.jpg", fit: BoxFit.cover,),
                ),
              ),

              SliverPadding(
                padding: const EdgeInsets.all(8.0),
                sliver: new SliverGrid( //Grid
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, //Grid按两列显示
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                    childAspectRatio: 4.0,
                  ),
                  delegate: new SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      //创建子widget      
                      return new Container(
                        alignment: Alignment.center,
                        color: Colors.cyan[100 * (index % 9)],
                        child: new Text('grid item $index'),
                      );
                    },
                    childCount: 20,
                  ),
                ),
              ),
              //List
              new SliverFixedExtentList(
                itemExtent: 50.0,
                delegate: new SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      //创建列表项      
                      return new Container(
                        alignment: Alignment.center,
                        color: Colors.lightBlue[100 * (index % 9)],
                        child: new Text('list item $index'),
                      );
                    },
                    childCount: 50 //50个列表项
                ),
              ),
            ],
          ),
        ),
        menuStatus ? Menu(menuStatus: menuStatus, callback: (value)=> onChanged(value)) : Text('')
      ]
    );
  }
}