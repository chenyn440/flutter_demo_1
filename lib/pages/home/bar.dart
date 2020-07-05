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
            padding: EdgeInsets.fromLTRB(40, 20, 50, 0),
            alignment: Alignment.bottomCenter,
            child: Column(
                children: [
                  Image.asset(
                    'assets/images/phone-icon.jpg',
                    fit: BoxFit.contain,
                    height: 40,
                  ),
                  Text(
                    'ios',
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
                  'assets/images/ipad-icon.jpg',
                  fit: BoxFit.contain,
                  height: 58.0,
                ),
                Text(
                  'ios',
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
                  'assets/images/mac-icon.jpg',
                  fit: BoxFit.contain,
                  height: 45.0,
                ),
                Text(
                  'ios',
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
                  'assets/images/tv-icon.jpg',
                  fit: BoxFit.contain,
                  height: 50.0,
                ),
                Text(
                  'ios',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Color.fromRGBO(255, 255, 255, 1)
                  ),
                )
              ]
            )
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 20, 50, 0),
            alignment: Alignment.bottomCenter,
            child: Column(
              children: [
                Image.asset(
                  'assets/images/wt-icon.jpg',
                  fit: BoxFit.contain,
                  height: 42.0,
                ),
                Text(
                  'ios',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Color.fromRGBO(255, 255, 255, 1)
                  ),
                )
              ]
            )
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 20, 40, 0),
            alignment: Alignment.bottomCenter,
            child: Column(
              children: [
                Image.asset(
                  'assets/images/apple-icon.jpg',
                  fit: BoxFit.contain,
                  height: 40.0,
                ),
                Text(
                  'ios',
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