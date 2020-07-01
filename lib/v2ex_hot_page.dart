import 'package:flutter/material.dart';

import 'package:dio/dio.dart';

class V2exHotPage extends StatefulWidget {
  @override
  _V2exHotPageState createState() => _V2exHotPageState();
}

class _V2exHotPageState extends State<V2exHotPage> {
  var _dataList = [];

  _loadData() async {
    Dio dio = Dio();
    Response response =
        await dio.get("https://www.v2ex.com/api/topics/hot.json");
    _dataList = response.data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('v2ex_hot'),
      ),
      body: FutureBuilder(
        future: _loadData(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          print(snapshot);
          if (ConnectionState.waiting != snapshot.connectionState) {
            return ListView.builder(
              itemCount: _dataList.length,
              itemBuilder: (context, index) {
                var map = _dataList[index];
                return Card(
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {},
                    child: ListTile(
                      title: Text(map['title']),
                      subtitle: Text(map['content']),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
