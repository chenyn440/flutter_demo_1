import 'package:flutter/material.dart';
import '../common/menu.dart';
/*
首页是带一个根据点击弹出菜单而改变中间文字的可变状态控件
 */
class GridViewPage extends StatefulWidget {
  
  // State<StatefulWidget> createState() {
  //   return new MenuGridViewPageState();
  // }
  @override
  GridViewPageState createState() => new GridViewPageState();
}

class GridViewPageState extends State<GridViewPage> {
  bool menuStatus = false;
  void onChanged(val){
    setState(() {
      menuStatus = val;
    });
  }
  List<IconData> _icons = []; //保存Icon数据
  @override
  void initState() {
    // 初始化数据  
    _retrieveIcons();
  }

   //模拟异步获取数据
  void _retrieveIcons() {
    Future.delayed(Duration(milliseconds: 200)).then((e) {
      setState(() {
        _icons.addAll([
          Icons.ac_unit,
          Icons.airport_shuttle,
          Icons.all_inclusive,
          Icons.beach_access,
          Icons.cake,
          Icons.free_breakfast
        ]);
      });
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
          //   body: GridView(
          //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //         crossAxisCount: 3, //横轴三个子widget
          //         childAspectRatio: 1.0 //宽高比为1时，子widget
          //     ),
          //     children:<Widget>[
          //       Icon(Icons.ac_unit),
          //       Icon(Icons.airport_shuttle),
          //       Icon(Icons.all_inclusive),
          //       Icon(Icons.beach_access),
          //       Icon(Icons.cake),
          //       Icon(Icons.free_breakfast)
          //     ]
          //   )
          // ),
          body: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, //每行三列
                childAspectRatio: 1.0 //显示区域宽高相等
            ),
            itemCount: _icons.length,
            itemBuilder: (context, index) {
              //如果显示到最后一个并且Icon总数小于200时继续获取数据
              if (index == _icons.length - 1 && _icons.length < 200) {
                _retrieveIcons();
              }
              return Icon(_icons[index]);
            }
          ),
        ),
        menuStatus ? Menu(menuStatus: menuStatus, callback: (value)=> onChanged(value)) : Text('')
      ]
    );
  }
}