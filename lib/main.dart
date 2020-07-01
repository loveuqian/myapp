import 'package:flutter/material.dart';

import 'webpagetest_page.dart';
import 'v2ex_hot_page.dart';

import 'package:random_color/random_color.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: RandomColor().randomMaterialColor(),
      ),
      home: MyHomePage(title: 'Super Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void getHttp() async {
    try {
      Dio dio = Dio();
      Response response = await dio
          .get("https://web.cloudmall.co/api/v/4.3.17/shopping/global_control");
      print(response);
    } catch (e) {
      print(e.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    getHttp();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WebPageTestPage()),
                );
              },
              child: Text('webpagetest'),
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => V2exHotPage()),
                );
              },
              child: Text('v2ex_hot'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
