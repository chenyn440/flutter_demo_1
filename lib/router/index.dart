import 'package:flutter/material.dart';
// import '../pages/demo/demo.dart';
// import '../pages/demo/ful.dart';
// import '../pages/demo/count.dart';
// import '../pages/demo/MyScaffold.dart';
import '../pages/home/index.dart';
import '../pages/design/index.dart';
import '../pages/develop/index.dart';
import '../pages/form/index.dart';
import '../pages/acount/index.dart';
import '../pages/support/index.dart';
import '../pages/gridView/index.dart';
import '../pages/customScrollView/index.dart';
import '../pages/dialog/index.dart';
import '../pages/webSocket/index.dart';
import '../pages/animate/index.dart';
import '../pages/animate/hero.dart';

// 配置路由
final routes = {
  // 前面是自己的命名 后面是加载的方法
  '/': (context) => Home(), //不用传参的写法
  "/home": (BuildContext context) => new Home(),  //主页面
  "/design": (BuildContext context) => new Design(),  //demo页面
  "/develop": (BuildContext context) => new Develop(),
  "/form": (BuildContext context) => new FormPage(),
  "/account": (BuildContext context) => new AccountPage(),
  "/support": (BuildContext context) => new SupportPage(),
  "/gridView":  (BuildContext context) => new GridViewPage(),
  "/customScrollViewPage":  (BuildContext context) => new CustomScrollViewPage(),
  "/dialogPage":  (BuildContext context) => new DialogPage(),
  "/webSocketRoute":  (BuildContext context) => new WebSocketRoute(),
  "/animatePage": (BuildContext context) => new AnimatePage(),
  "/hero": (BuildContext context) => new HeroAnimationRoute()
  // "/FulApp": (BuildContext context) => new FulApp(),  //FulApp页面
  // "/count": (BuildContext context) => new MyHomePage(title: 'Flutter Demo Home Page'),  //FulApp页面
};

// 固定写法，统一处理，无需更改
var onGenerateRoute = (RouteSettings settings) {
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};