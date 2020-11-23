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
      home: CounterWidget(title: 'Flutter Demo Home Page')
    );
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({
    Key key, 
    this.title, 
    this.initValue: 0,
  }) : super(key: key);

  final String title;
  final int initValue;

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter;

    @override
  void initState() {
    super.initState();
    //初始化状态  
    _counter = widget.initValue;
    print("initState");
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
     print("build");
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            Text.rich(TextSpan( // Text内容的不同部分按照不同的样式显示
              children: [
              TextSpan(
                text: "Home: "
              ),
              TextSpan(
                text: "https://flutterchina.club",
                style: TextStyle(
                  color: Colors.blue
                ),  
                // recognizer: _tapRecognizer // tapRecognizer，它是点击链接后的一个处理器（
              ),
              ]
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }

  @override
  void didUpdateWidget(CounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  @override
  void reassemble() {
    super.reassemble();
    print("reassemble");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("deactive"); // CounterWidget从widget树中移除时，deactive和dispose会依次被调用。
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }




}
