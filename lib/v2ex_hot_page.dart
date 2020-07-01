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
    Response response = await dio
        .get('https://web.cloudmall.co/api/search/hot_search?region=US');
    _dataList = response.data['data']['searches'];
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
                      title: Text(map['searchText']),
                      subtitle: Text(map['searchOpt'].toString()),
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
