import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  String _search;

  int _offset = 0;
  
  Future<Map> _getGifs() async {
    http.Response response;
    
    if(_search == null) response = await http.get("https://api.giphy.com/v1/gifs/trending?api_key=2PcuVWw0nYYP2Y8qiLmOug4aqu4xPUYH&limit=20&offset=$_offset&rating=g&bundle=messaging_non_clips");
    else response = await http.get("https://api.giphy.com/v1/gifs/search?api_key=2PcuVWw0nYYP2Y8qiLmOug4aqu4xPUYH&q=$_search&limit=20&offset=$_offset&rating=g&lang=en&bundle=messaging_non_clips");

    return json.decode(response.body);
  }


  @override
  void initState() {
    super.initState();

    _getGifs().then((map) {
      print(map);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
