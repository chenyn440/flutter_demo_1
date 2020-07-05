import 'package:flutter/material.dart';
import './router/index.dart';
import './pages/common/NavigatorObserver.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import './pages/store/reducer.dart';

void main() {
  final store = Store<CountState>(reducer, initialState: CountState.initState());
    runApp( StoreProvider<CountState>(
      store: store,
      child: new MaterialApp(
        initialRoute: '/', //初始化加载的路由
        onGenerateRoute: onGenerateRoute,
        navigatorKey: Router.navigatorKey
      ),
    )
  );
  // 代表使用纸墨设计（Material Design）风格的应用。里面包含了纸墨设计风格应用所需要的基本控件。
  // runApp(new MaterialApp(
  //   initialRoute: '/', //初始化加载的路由
  //   onGenerateRoute: onGenerateRoute,
  //   navigatorKey: Router.navigatorKey
    // title: 'My app', // used by the OS task switcher
    // home: new MyScaffold(),
    // // 添加路由
    // routes: <String, WidgetBuilder>{
    //   // "/home": (BuildContext context) => new MyScaffold(),  //主页面
    //   // "/app": (BuildContext context) => new App(),  //demo页面
    //   // "/FulApp": (BuildContext context) => new FulApp(),  //FulApp页面
    //   // "/count": (BuildContext context) => new MyHomePage(title: 'Flutter Demo Home Page'),  //FulApp页面
    //   new Router()
    // },
  // ));
}