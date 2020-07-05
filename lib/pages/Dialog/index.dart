import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../common/menu.dart';
import '../common/NavigatorObserver.dart';

/*
首页是带一个根据点击弹出菜单而改变中间文字的可变状态控件
 */
class DialogPage extends StatefulWidget {
  
  // State<StatefulWidget> createState() {
  //   return new MenuDialogPageState();
  // }
  @override
  DialogPageState createState() => new DialogPageState();
}

class DialogPageState extends State<DialogPage> {
  bool menuStatus = false;
  String dialogType = '';
  String _operation = "No Gesture detected!"; //保存事件名
  double _top = 80.0; //距顶部的偏移
  double _left = 80.0;//距左边的偏移
  void onChanged(val){
    setState(() {
      menuStatus = val;
    });
  }
  void openDialog(val) {
    setState(() {
      dialogType = val;
    });
  }
  final dialog = AlertDialog(
      title: Text("提示"),
      titlePadding: EdgeInsets.fromLTRB(20, 20, 0, 20),
      content: Text("您确定要删除当前文件吗?"),
      elevation: 1,
      actions: <Widget>[
        FlatButton(
          child: Text("取消"),
          onPressed: () => Router.navigatorKey.currentState.pushNamed('/dialogPage'), //关闭对话框
        ),
        FlatButton(
          child: Text("删除"),
          onPressed: () {
            // ... 执行删除操作
            Router.navigatorKey.currentState.pushNamed('/dialogPage'); //关闭对话框
          },
        ),
      ],
    );
  // 弹出对话框
  Future<bool> showDeleteConfirmDialog1() {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("提示"),
          content: Text("您确定要删除当前文件吗?"),
          actions: <Widget>[
            FlatButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(), // 关闭对话框
            ),
            FlatButton(
              child: Text("删除"),
              onPressed: () {
                //关闭对话框并返回true
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> changeLanguage() async {
    int i = await showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('请选择语言'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  // 返回1
                  Navigator.pop(context, 1);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text('中文简体'),
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  // 返回2
                  Navigator.pop(context, 2);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text('美国英语'),
                ),
              ),
            ],
          );
        });

    if (i != null) {
      print("选择了：${i == 1 ? "中文简体" : "美国英语"}");
    }
  }
  Future<void> showListDialog() async {
    int index = await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        var child = Column(
          children: <Widget>[
            ListTile(title: Text("请选择")),
            Expanded(
                child: ListView.builder(
              itemCount: 30,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text("$index"),
                  onTap: () => Navigator.of(context).pop(index),
                );
              },
            )),
          ],
        );
        //使用AlertDialog会报错
        //return AlertDialog(content: child);
        return Dialog(child: child);
      },
    );
    if (index != null) {
      print("点击了：$index");
    }
  }
  Future<DateTime> showDatePicker1() {
    var date = DateTime.now();
    return showDatePicker(
      context: context,
      initialDate: date,
      firstDate: date,
      lastDate: date.add( //未来30天可选
        Duration(days: 30),
      ),
    );
  }
  Future<DateTime> showDatePicker2() {
    var date = DateTime.now();
    return showCupertinoModalPopup(
      context: context,
      builder: (ctx) {
        return SizedBox(
          height: 200,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.dateAndTime,
            minimumDate: date,
            maximumDate: date.add(
              Duration(days: 30),
            ),
            maximumYear: date.year + 1,
            onDateTimeChanged: (DateTime value) {
              print(value);
            },
          ),
        );
      },
    );
  }
  Future<int> showModalBottomSheetDefine() async {
    return showModalBottomSheet<int>(
      context: context,
      builder: (BuildContext context) {
        return ListView.builder(
          itemCount: 30,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text("$index"),
              onTap: () => Navigator.of(context).pop(index),
            );
          },
        );
      },
    );
  }
  void updateText(String text) {
    //更新显示的事件名
    setState(() {
      _operation = text;
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
          body: Column(
            children: [
              RaisedButton(
                child: Text("对话框1"),
                onPressed: () async {
                  //弹出对话框并等待其关闭
                  bool delete = await showDeleteConfirmDialog1();
                  if (delete == null) {
                    print("取消删除");
                  } else {
                    print("已确认删除");
                    //... 删除文件
                  }
                },
              ),
              RaisedButton(
                child: Text("选择对话框1"),
                onPressed: () async {
                  //弹出对话框并等待其关闭
                  await changeLanguage();
                },
              ),
              RaisedButton(
                child: Text("listview对话框"),
                onPressed: () async {
                  //弹出对话框并等待其关闭
                  await showListDialog();
                },
              ),
              RaisedButton(
                child: Text("底部"),
                onPressed: () async {
                  //弹出对话框并等待其关闭
                  await showModalBottomSheetDefine();
                },
              ),
              RaisedButton(
                child: Text("日期"),
                onPressed: () async {
                  var date = await showDatePicker1();
                  print(date);
                  // if (delete == null) {
                  //   print("取消删除");
                  // } else {
                  //   print("同时删除子目录: $delete");
                  // }
                },
              ),
              RaisedButton(
                child: Text("时间"),
                onPressed: () async {
                  var time = await showDatePicker2();
                  print(time);
                  // if (delete == null) {
                  //   print("取消删除");
                  // } else {
                  //   print("同时删除子目录: $delete");
                  // }
                },
              ),
              Listener(
                child: ConstrainedBox(
                  constraints: BoxConstraints.tight(Size(300.0, 200.0)),
                  child: DecoratedBox(
                      decoration: BoxDecoration(color: Colors.blue)),
                ),
                onPointerDown: (event) => print("down0"),
              ),
              GestureDetector(
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.blue,
                  width: 200.0, 
                  height: 100.0,
                  child: Text(_operation,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                onTap: () => updateText("Tap"),//点击
                onDoubleTap: () => updateText("DoubleTap"), //双击
                onLongPress: () => updateText("LongPress"), //长按
              ), dialogType == 'type1' ? dialog : Text('')
            ]
          ),
        ),
        Positioned(
          top: _top,
          left: _left,
          child: GestureDetector(
            child: CircleAvatar(child: Text("A")),
            //手指按下时会触发此回调
            onPanDown: (DragDownDetails e) {
              //打印手指按下的位置(相对于屏幕)
              print("用户手指按下：${e.globalPosition}");
            },
            //手指滑动时会触发此回调
            onPanUpdate: (DragUpdateDetails e) {
              //用户手指滑动时，更新偏移，重新构建
              setState(() {
                _left += e.delta.dx;
                _top += e.delta.dy;
              });
            },
            onPanEnd: (DragEndDetails e){
              //打印滑动结束时在x、y轴上的速度
              print(e.velocity);
            },
          ),
        ),
        menuStatus ? Menu(menuStatus: menuStatus, callback: (value)=> onChanged(value)) : Text('')
      ]
    );
  }
}