import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:ui'; // window会报错


class SwiperPage extends StatefulWidget {
  @override
  SwiperPageState createState() {
    return SwiperPageState();
  }
}

class SwiperPageState extends State<SwiperPage> {
  @override
  Widget build(BuildContext context) {
    List<String> arr = [
      'https://pics4.baidu.com/feed/0d338744ebf81a4c98f7803da4c0d75f272da66a.jpeg?token=4814884e7eea5171948acd9f895db2ba',
      'https://pics1.baidu.com/feed/7c1ed21b0ef41bd502cf2186223036cd38db3d11.jpeg?token=d7b99f4f3926992117cb32603d07aeb5',
      'https://pics1.baidu.com/feed/54fbb2fb43166d22d39650c933c9bef19252d2ff.jpeg?token=f304e80f9e86b369643159e0882ccb79'
    ];
    return Container(
      width: window.physicalSize.width,
      height: 300,
      child: Swiper(
        itemBuilder: (context,index)=>Image.network(
          arr[index],
          fit: BoxFit.fitHeight
        ),
        itemCount: 3,
        pagination: SwiperPagination(
          builder: DotSwiperPaginationBuilder(
            color: Colors.green[200],
            activeColor: Colors.green,
          ),
        ),
        // control:SwiperControl(),控制分页
        scrollDirection: Axis.horizontal,
        autoplay: true,
        // viewportFraction: 0.8,
        // // 当前视窗展示比例 小于1可见上一个和下一个视窗
        // scale: 0.8, // 两张图片之间的间隔
        onTap: (index) => print('点击了第$index个'),
    ));
  }
}

