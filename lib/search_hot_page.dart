import 'package:flutter/material.dart';

import 'package:dio/dio.dart';

class SearchHotPage extends StatefulWidget {
  @override
  _SearchHotPageState createState() => _SearchHotPageState();
}

class _SearchHotPageState extends State<SearchHotPage> {
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
        title: Text('search_hot'),
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
