import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  
  Menu({Key key, this.menuStatus, this.callback})
      :super(key: key);
  final callback;
  bool menuStatus;

  @override
  MenuStarus createState() => new MenuStarus();

}

class MenuStarus extends State<Menu> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        // 渐变
        flexibleSpace: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 1,color: Color(0xffe5e5e5))
            ),
            gradient: LinearGradient(
              colors: [Color.fromRGBO(255, 255, 255, 1), Color.fromRGBO(255, 255, 255, 1)],
            ),
          ),
        ),
        centerTitle: true,
        elevation: 0, // 去掉底部阴影
        leading: Builder(
          builder: (BuildContext context) {
            return new IconButton(
              icon: Image.asset(
                'assets/images/close.jpg',
                width: 30.0,
              ),
              onPressed: () {
                doChangeCallback();
              },
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
      body: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: [
          Container(
            child: new IconButton(
              icon: Text(
                '发现',
                style: TextStyle(
                  fontSize: 22.0
                ),
              ),
              iconSize: 60,
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              color: Color.fromRGBO(0, 0, 0, 1)
            ),
            alignment: Alignment.bottomLeft,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1,color: Color(0xffe5e5e5))
              )
            ),
            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
          ),
          Container(
            child: new IconButton(
              icon: Text(
                '设计',
                style: TextStyle(
                  fontSize: 22.0
                ),
              ),
              iconSize: 60,
              onPressed: () {
                Navigator.pushNamed(context, '/design');
              },
              color: Color.fromRGBO(0, 0, 0, 1)
            ),
            alignment: Alignment.bottomLeft,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1,color: Color(0xffe5e5e5))
              )
            ),
            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
          ),
          Container(
            child: new IconButton(
              icon: Text(
                '发展',
                style: TextStyle(
                  fontSize: 22.0
                ),
              ),
              iconSize: 60,
              onPressed: () {
                Navigator.pushNamed(context, '/develop');
              },
              color: Color.fromRGBO(0, 0, 0, 1)
            ),
            alignment: Alignment.bottomLeft,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1,color: Color(0xffe5e5e5))
              )
            ),
            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
          ),
          Container(
            child: new IconButton(
              icon: Text(
                '分发',
                style: TextStyle(
                  fontSize: 22.0
                ),
              ),
              iconSize: 60,
              onPressed: () {
                Navigator.pushNamed(context, '/form');
              },
              color: Color.fromRGBO(0, 0, 0, 1)
            ),
            alignment: Alignment.bottomLeft,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1,color: Color(0xffe5e5e5))
              )
            ),
            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
          ),
          Container(
            child: new IconButton(
              icon: Text(
                '支持',
                style: TextStyle(
                  fontSize: 22.0
                ),
              ),
              iconSize: 60,
              onPressed: () {
                Navigator.pushNamed(context, '/support');
              },
              color: Color.fromRGBO(0, 0, 0, 1)
            ),
            alignment: Alignment.bottomLeft,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1,color: Color(0xffe5e5e5))
              )
            ),
            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
          ),
          Container(
            child: new IconButton(
              icon: Text(
                '账户',
                style: TextStyle(
                  fontSize: 22.0
                ),
              ),
              iconSize: 60,
              onPressed: () {
                 Navigator.pushNamed(context, '/account');
              },
              color: Color.fromRGBO(0, 0, 0, 1)
            ),
            alignment: Alignment.bottomLeft,
            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
          ),
          Container(
            child: new IconButton(
              icon: Text(
                'GridView',
                style: TextStyle(
                  fontSize: 22.0
                ),
              ),
              iconSize: 60,
              onPressed: () {
                 Navigator.pushNamed(context, '/gridView');
              },
              color: Color.fromRGBO(0, 0, 0, 1)
            ),
            alignment: Alignment.bottomLeft,
            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
          ),
          Container(
            width: 200.0,
            child: new IconButton(
              icon: Text(
                'CustomScrollView',
                style: TextStyle(
                  fontSize: 22.0
                ),
              ),
              iconSize: 60,
              onPressed: () {
                 Navigator.pushNamed(context, '/customScrollViewPage');
              },
              color: Color.fromRGBO(0, 0, 0, 1)
            ),
            alignment: Alignment.bottomLeft,
            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
          ),
          Container(
            width: 200.0,
            child: new IconButton(
              icon: Text(
                '对话框',
                style: TextStyle(
                  fontSize: 22.0
                ),
              ),
              iconSize: 60,
              onPressed: () {
                 Navigator.pushNamed(context, '/dialogPage');
              },
              color: Color.fromRGBO(0, 0, 0, 1)
            ),
            alignment: Alignment.bottomLeft,
            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
          ),
          Container(
            width: 200.0,
            child: new IconButton(
              icon: Text(
                'webSocketRoute',
                style: TextStyle(
                  fontSize: 22.0
                ),
              ),
              iconSize: 60,
              onPressed: () {
                 Navigator.pushNamed(context, '/webSocketRoute');
              },
              color: Color.fromRGBO(0, 0, 0, 1)
            ),
            alignment: Alignment.bottomLeft,
            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
          ),
          Container(
            width: 200.0,
            child: new IconButton(
              icon: Text(
                'animatePage',
                style: TextStyle(
                  fontSize: 22.0
                ),
              ),
              iconSize: 60,
              onPressed: () {
                 Navigator.pushNamed(context, '/animatePage');
              },
              color: Color.fromRGBO(0, 0, 0, 1)
            ),
            alignment: Alignment.bottomLeft,
            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
          ),
          Container(
            width: 200.0,
            child: new IconButton(
              icon: Text(
                'hero',
                style: TextStyle(
                  fontSize: 22.0
                ),
              ),
              iconSize: 60,
              onPressed: () {
                 Navigator.pushNamed(context, '/hero');
              },
              color: Color.fromRGBO(0, 0, 0, 1)
            ),
            alignment: Alignment.bottomLeft,
            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
          )
        ]
      )
    );
  }
  
  void doChangeCallback() {
    widget.callback(false);
  }
}