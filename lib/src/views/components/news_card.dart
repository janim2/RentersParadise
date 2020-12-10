import 'package:flutter/material.dart';

class NewsCard extends StatefulWidget {
  @override
  _NewsCardState createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  String _newsTitle = "Renters Paradise launches New App";

  AssetImage _imageHausphoto;

  @override
  void initState() {
    super.initState();

    _imageHausphoto = AssetImage('assets/hausphotomedia-com-aRT5UCf2MYY-unsplash.jpg');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    precacheImage(_imageHausphoto, context);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        margin: EdgeInsets.only(bottom: 18.0, top: 10.0 ),
        child: Container(
          padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0, bottom: 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: _imageHausphoto
                    )
                  ),
                ),
              ),
              SizedBox(height: 8.0,),
              Text("News",
              style: TextStyle(
                fontFamily: 'Futura',
                fontSize: 16.0,
              ),),
              SizedBox(height: 6.0,),
              Divider(thickness: 2.0,),
              SizedBox(height: 8.0,),
              Text(_newsTitle,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                  fontSize: 18.0
                ),)
            ],
          ),
        ),
      ),
    );
  }
}
