import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

void main() => runApp(new MyApp());

// 此处例子是从项目中抽象出来的简写例子
// 当然了实际项目中使用的数据是dio请求接口的数据
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '折线图',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new ChartPage(),
    );
  }
}

class ChartPage extends StatefulWidget {
  @override
  _ChartPageState createState() => new _ChartPageState();
}

class SeriesDatas {
  final int time;
  final int data;

  SeriesDatas(this.time, this.data);
}

class _ChartPageState extends State<ChartPage> {
  // 折线图
  Widget _chartWidget() {
    final serial1data = [
      new SeriesDatas(1, 5),
      new SeriesDatas(2, 25),
      new SeriesDatas(3, 100),
      new SeriesDatas(4, 75),
    ];

    final serial2data = [
      new SeriesDatas(1, 15),
      new SeriesDatas(2, 125),
      new SeriesDatas(3, 30),
      new SeriesDatas(4, 175),
    ];
    List<charts.Series<SeriesDatas, int>> seriesList = [
      new charts.Series<SeriesDatas, int>(
        id: 'line1',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (SeriesDatas sales, _) => sales.time,
        measureFn: (SeriesDatas sales, _) => sales.data,
        data: serial1data,
      ),
      new charts.Series<SeriesDatas, int>(
        id: 'line2',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (SeriesDatas sales, _) => sales.time,
        measureFn: (SeriesDatas sales, _) => sales.data,
        data: serial2data,
      )
    ];

    var chart = new charts.LineChart(
      seriesList,
      animate: true,
      behaviors: [
        new charts.SeriesLegend(
          // 图例位置 在左侧start 和右侧end
          position: charts.BehaviorPosition.end,
          // 图例条目  [horizo​​ntalFirst]设置为false，图例条目将首先作为新行而不是新列增长
          horizontalFirst: false,
          // 每个图例条目周围的填充Padding
          cellPadding: new EdgeInsets.only(right: 4.0, bottom: 4.0),
          // 显示度量
          showMeasures: true,
          // 度量格式
          measureFormatter: (num value) {
            return value == null ? '-' : '${value}k';
          },
        ),
      ],
    );

    return new Card(
      child: Container(
        padding: new EdgeInsets.fromLTRB(16, 10, 16, 20),
        margin: new EdgeInsets.only(bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Center(
              child: new Text(
                'xxxx (折线图)',
                style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1.0), //opacity：不透明度
                  fontFamily: 'PingFangBold',
                  fontSize: 15.0,
                ),
              ),
            ),
            new Padding(
              padding: new EdgeInsets.all(32.0),
              child: new SizedBox(
                height: 200.0,
                child: chart,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: _chartWidget(),
      ),
    );
  }
}