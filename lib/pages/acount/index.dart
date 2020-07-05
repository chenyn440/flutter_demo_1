import 'package:flutter/material.dart';
import '../common/menu.dart';
import './swiper.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../store/reducer.dart';
/*
首页是带一个根据点击弹出菜单而改变中间文字的可变状态控件
 */
class AccountPage extends StatefulWidget {
  
  // State<StatefulWidget> createState() {
  //   return new MenuAccountPagePageState();
  // }
  @override
  AccountPagePageState createState() => new AccountPagePageState();
}

class AccountPagePageState extends State<AccountPage> {
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
              Container(
                child: StoreConnector<CountState,int>(
                  converter: (store) => store.state.count,
                  builder: (context, count) {
                    return Text(
                      '${count.toString()}测试中',
                      style: Theme.of(context).textTheme.display1,
                    );
                  },
                ),
              ),
              Container(
                child:  StoreConnector<CountState,VoidCallback>(
                  converter: (store) {
                    return () => store.dispatch(ActionStore.increment);
                  },
                  builder: (context, callback) {
                    return FloatingActionButton(
                      onPressed: callback,
                      child: Icon(Icons.add),
                    );
                  },
                )
              ),
              Container(
                alignment: Alignment.center,
                child:  StoreConnector<CountState,VoidCallback>(
                  converter: (store) {
                    return () => store.dispatch(ActionStore.reduction);
                  },
                  builder: (context, callback) {
                    return SizedBox(
                        width: 80.0,
                        child: RaisedButton(
                        onPressed: callback,
                        color: Colors.blue,
                        highlightColor: Colors.blue[700],
                        colorBrightness: Brightness.dark,
                        splashColor: Colors.grey,
                        child: Text("reduce"),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                      )
                    );
                  },
                )
              )
            ]
          )
        ),
        menuStatus ? Menu(menuStatus: menuStatus, callback: (value)=> onChanged(value)) : Text('')
      ]
    );
  }
}