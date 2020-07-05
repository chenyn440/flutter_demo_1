// import 'dart:async';
import 'package:flutter/material.dart';
import '../common/menu.dart';
import './hero.dart';
// import '../common/NavigatorObserver.dart';

class AnimatePage extends StatefulWidget {
  @override
  AnimatePageState createState() => new AnimatePageState();
}

class AnimatePageState extends State<AnimatePage> with SingleTickerProviderStateMixin {
  bool menuStatus = false;

  Animation<double> animation;
  AnimationController controller;

  initState() {
    super.initState();
    controller = new AnimationController(
      duration: const Duration(seconds: 1), vsync: this
    );
    //图片宽高从0变到300
    animation = new Tween(begin: 0.0, end: 300.0).animate(controller)
      ..addListener(() {
        setState(()=>{});
      });
    //启动动画(正向执行)
    controller.forward();
  }

  void onChanged(val){
    setState(() {
      menuStatus = val;
    });
  }

  dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
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
          // HeroAnimationRoute
          body: Column(
            children: [
              Center(
                child: Image.asset("assets/images/img.jpg",
                    width: animation.value,
                    height: animation.value
                ),
              ),
              HeroAnimationRoute()
            ]
          )
        ),
        menuStatus ? Menu(menuStatus: menuStatus, callback: (value)=> onChanged(value)) : Text('')
      ]
    );
  }
}