import 'package:flutter/material.dart';
import 'package:rentersparadise/Components/newsCard.dart';
import 'package:rentersparadise/Helpers/app_properties_bloc.dart';
import 'package:rentersparadise/Screens/Explore_Items_News_Onboarding_Screens/NewsScreen.dart';

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
      return GestureDetector(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => NewsScreen()));
        },
          child: NewsCard());
    });
  }

  @override
  void initState() {
    super.initState();
    appBloc.updateTitle('NEWS');

  }
}