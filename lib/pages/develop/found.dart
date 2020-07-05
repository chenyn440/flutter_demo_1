import 'package:flutter/cupertino.dart';

class Found extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // 横向对齐
        children: [
          Text(
            '发现',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 20),
          Text(
            '无限可能',
            style: TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 30),
          Text(
            '为Apple平台而开发，使macOS，iOS，watchOS和tvOS的尖端技术触手可及，为您提供了无数种方法，可以为世界各地的用户带来令人难以置信的应用程序。这些强大的平台各自提供独特的功能和用户体验，并且紧密集成以形成一个真正的生态系统。',
            style: TextStyle(
              fontSize: 22.0
            ),
          )
        ]
      ),
    );
  }
}