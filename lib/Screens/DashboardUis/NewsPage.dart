import 'package:flutter/material.dart';
import 'package:rentersparadise/Components/newsCard.dart';

class NewsPage extends StatefulWidget {

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        itemCount: 8,
        itemBuilder: (context, index) {
      return NewsCard();
    });
  }
}