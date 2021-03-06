import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

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
        home: CategoryPage());
  }
}

class CategoryPage extends StatefulWidget {
  CategoryPage({Key key}) : super(key: key);

  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.white,
              leading: new IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {},
              ),
              title: Container(
                color: HexColor('#f2f2f2f2'),
                padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
                width: 170.0,
                height: 38.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                          //  decoration: BoxDecoration(color: Colors.red),
                        child: Center(
                        child: TabBar(
                          // indicatorWeight: 10,
                          isScrollable: true, //多个Tab的时候，可以实现滑动和联动
                          // indicatorColor:Colors.blue,
                          indicator: BoxDecoration(
                              color: Colors.white,),
                              // borderRadius: BorderRadius.all(Radius.circular(15))),
                          labelColor: Colors.blue,
                          // labelPadding: EdgeInsets.only(left: 20),
                          unselectedLabelColor: HexColor('#6B7389'),
                          indicatorSize: TabBarIndicatorSize.label,
                          tabs: <Widget>[
                            Container(
                              // color: Colors.yellow,
                              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: Row(
                                children: <Widget>[
                                  Tab(text: "当前持仓"),
                                ],
                              ),
                              // margin: EdgeInsets.only(top: 50.0, left: 120.0), //容器外填充
                              // constraints: BoxConstraints.tightFor(width: 100.0), //卡片大小
                              // decoration: BoxDecoration(
                              //     gradient: LinearGradient(colors: [
                              //       Colors.red,
                              //       Colors.orange[700]
                              //     ]), //背景渐变
                              //     borderRadius: BorderRadius.circular(3.0), //3像素圆角
                              //     boxShadow: [
                              //       //阴影
                              //       BoxShadow(
                              //           color: Colors.black54,
                              //           offset: Offset(2.0, 2.0),
                              //           blurRadius: 4.0)
                              //     ]),
                              // child: Tab(text: '推荐'),
                            ),
                          Container(
                              // color: Colors.yellow,
                              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: Row(
                                children: <Widget>[
                                  Tab(text: "当前资产"),
                                ],
                              ),
                          )
                            // Tab(text: "当前资产"),
                            // Tab(text: "推荐"),
                            // Tab(text: "推荐"),
                          ],
                        ),
                      )),
                    ),
                  ],
                ),
              )),
          body: TabBarView(
            children: <Widget>[
              ListView(
                children: <Widget>[
                  ListTile(title: Text("第一个tab")),
                ],
              ),
              ListView(
                children: <Widget>[
                  ListTile(title: Text("第二个tab")),
                ],
              ),
            ],
          )),
    );
  }
}
