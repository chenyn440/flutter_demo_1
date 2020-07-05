import 'package:flutter/cupertino.dart';

class Vision extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center, // 横向对齐
        children: [
          Text(
            '设计。发展。分发。',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 20),
          Text(
            '建立愿景',
            style: TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 30),
          Text(
            '借助强大的工具和资源集，交互式Swift编程语言以及革命性的Apple技术，创新的可能性无穷无尽。您将发现如何构建非凡的应用程序，以将信息，娱乐和服务带给用户，无论他们身在何处。',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 21.0
            ),
          ),
          SizedBox(height: 10),
          Image.asset('assets/images/vision.jpg')
        ]
      )
    );
  }
}