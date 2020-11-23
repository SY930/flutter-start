import 'dart:developer';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo---',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: Text("xxx"),
        home: FormTestRoute(title: 'Form'));
  }
}

class FormTestRoute extends StatefulWidget {
  const FormTestRoute({
    Key key,
    this.title,
  }) : super(key: key);

  final String title;
  @override
  _FormTestRouteState createState() => new _FormTestRouteState();
}

class _FormTestRouteState extends State<FormTestRoute> {
  TextEditingController _unameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();

  GlobalKey _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          child: Form(
              key: _formKey,
              autovalidate: true, // 开启自动检验
              child: Column(
                children: <Widget>[
                  TextFormField(
                      autofocus: true,
                      controller: _unameController,
                      decoration: InputDecoration(
                          labelText: "用户名",
                          hintText: "用户名或邮箱",
                          icon: Icon(Icons.person)),
                      // 校验用户名
                      validator: (v) {
                        return v.trim().length > 0 ? null : "用户名不能为空";
                      }),
                  TextFormField(
                      controller: _pwdController,
                      decoration: InputDecoration(
                          labelText: "密码",
                          hintText: "您的登录密码",
                          icon: Icon(Icons.lock)),
                      obscureText: true,
                      //校验密码
                      validator: (v) {
                        return v.trim().length > 5 ? null : "密码不能少于6位";
                      }),
                  // 登录按钮
                  Padding(
                    padding: const EdgeInsets.only(top: 28.0),
                    child: Row(children: <Widget>[
                      Expanded(child: Builder(builder: (context) {
                        // 通过Builder来获取RaisedButton所在widget树的真正context(Element)
                        return RaisedButton(
                          padding: EdgeInsets.all(15.0),
                          child: Text("登录"),
                          color: Theme.of(context).primaryColor,
                          textColor: Colors.white,
                          onPressed: () {
                            if (Form.of(context).validate()) {
                              //验证通过提交数据
                            }
                          },
                        );
                      }))
                    ]),
                  )
                ],
              )),
          //   Column(
          //   children: <Widget>[
          //     TextField(
          //       autofocus: true,
          //       decoration: InputDecoration(
          //           labelText: "用户名",
          //           hintText: "用户名或邮箱",
          //           prefixIcon: Icon(Icons.person)),

          //     ),
          //     TextField(
          //       decoration: InputDecoration(
          //           labelText: "密码",
          //           hintText: "您的登录密码",
          //           prefixIcon: Icon(Icons.lock)),
          //           obscureText: true,
          //     ),
          //   ],
          // ),
        ));
  }
}
