import 'package:flutter/material.dart';
import '../common/menu.dart';
import '../common/NavigatorObserver.dart';

class FormPage extends StatefulWidget {
  @override
  FormPageState createState() => new FormPageState();
}

class FormPageState extends State<FormPage> {
  bool menuStatus = false;
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  String _name;

  String _password;

  void forSubmitted() {
    var _form = _formKey.currentState;
    if (_form.validate()) {
      _form.save();
      print(_name);
      print(_password);
      Router.navigatorKey.currentState.pushNamed('/home');
    }
  }


  void onChanged(val){
    setState(() {
      menuStatus = val;
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
          floatingActionButton: new FloatingActionButton(
            onPressed: forSubmitted,
            child: new Text('提交'),
          ),
          body: new Form(
            key: _formKey,
            child: new Column(
              children: <Widget>[
                new TextFormField(
                  decoration: new InputDecoration(
                    labelText: 'Your Name',
                  ),
                  onSaved: (val) {
                    _name = val;
                  },
                ),
                new TextFormField(
                  decoration: new InputDecoration(
                    labelText: 'Password',
                  ),
                  obscureText: true,
                  validator: (val) {
                    return val.length < 4 ? "密码长度错误" : null;
                  },
                  onSaved: (val) {
                    _password = val;
                  },
                ),
              ],
            ),
          ),
        ),
        menuStatus ? Menu(menuStatus: menuStatus, callback: (value)=> onChanged(value)) : Text('')
      ]
    );
  }
}