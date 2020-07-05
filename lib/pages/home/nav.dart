import 'package:flutter/material.dart';

class Nav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      // 渐变
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      leading: Builder(
        builder: (BuildContext context) {
          return new IconButton(
            icon: ImageIcon(
              AssetImage(
                'assets/images/close.jpg'
              )
            ),
            onPressed: () {
              // setState(() {
              //   menuStatus = true;
              // });
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
    );
  }
}