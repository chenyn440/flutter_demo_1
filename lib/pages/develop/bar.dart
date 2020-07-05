import 'package:flutter/material.dart';

class Bar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(51,51,51,0.9),
      height: 110.0,
      padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(40, 14, 50, 0),
            alignment: Alignment.bottomCenter,
            child: Column(
                children: [
                  Image.asset(
                    'assets/images/icon-xcode.jpg',
                    fit: BoxFit.contain,
                    height: 40,
                  ),
                  Text(
                    'xcode',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Color.fromRGBO(255, 255, 255, 1)
                    ),
                  )
                ]
              )
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 4, 50, 0),
            alignment: Alignment.bottomCenter,
            child: Column(
              children: [
                Image.asset(
                  'assets/images/xun-su.jpg',
                  fit: BoxFit.contain,
                  height: 50.0,
                ),
                Text(
                  '迅速',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Color.fromRGBO(255, 255, 255, 1)
                  ),
                )
              ]
            )
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 10, 50, 0),
            alignment: Alignment.bottomCenter,
            child: Column(
              children: [
                Image.asset(
                  'assets/images/icon-testflight.jpg',
                  fit: BoxFit.contain,
                  height: 45.0,
                ),
                Text(
                  '试飞',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Color.fromRGBO(255, 255, 255, 1)
                  ),
                )
              ]
            )
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 10, 50, 0),
            alignment: Alignment.bottomCenter,
            child: Column(
              children: [
                Image.asset(
                  'assets/images/icon-documentation.jpg',
                  fit: BoxFit.contain,
                  height: 46.0,
                ),
                Text(
                  '文献资料',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Color.fromRGBO(255, 255, 255, 1)
                  ),
                )
              ]
            )
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 16, 50, 0),
            alignment: Alignment.bottomCenter,
            child: Column(
              children: [
                Image.asset(
                  'assets/images/icon-videos.jpg',
                  fit: BoxFit.contain,
                  height: 42.0,
                ),
                Text(
                  '影片',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Color.fromRGBO(255, 255, 255, 1)
                  ),
                )
              ]
            )
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 16, 50, 0),
            alignment: Alignment.bottomCenter,
            child: Column(
              children: [
                Image.asset(
                  'assets/images/icon-load.jpg',
                  fit: BoxFit.contain,
                  height: 42.0,
                ),
                Text(
                  '资料下载',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Color.fromRGBO(255, 255, 255, 1)
                  ),
                )
              ]
            )
          )
        ],
      ),
    );
  }
}