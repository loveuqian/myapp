import 'package:flutter/material.dart';

class WebPageTestPage extends StatefulWidget {
  @override
  _WebPageTestPageState createState() => _WebPageTestPageState();
}

class _WebPageTestPageState extends State<WebPageTestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('webpagetest'),
      ),
      body: Center(
        child: Text('666'),
      ),
    );
  }
}
