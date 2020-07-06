import 'package:flutter/material.dart';
import 'appconstant.dart';

class DetailPage extends StatelessWidget {

  final listing;

  const DetailPage({Key key, @required this.listing}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
          decoration: BoxDecoration(gradient: LinearGradient(colors: [
          appColor, Colors.orange
        ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(listing["listingtitle"]),
          elevation: 0.0,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Hero(
                  tag: listing["id"],
                  child: CircleAvatar(
                    radius: 100.0,
                    backgroundImage: NetworkImage("https://jssors8.azureedge.net/demos/img/gallery/720x480/006.jpg")),
              ),
              SizedBox(height: 10.0,),
              Text("Post Id: ${listing["id"]}",
                  style: TextStyle(
                    fontSize: appFontSize,
                    color: Colors.white,
                  ),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("${listing["listingtitle"]}",
                    style: TextStyle(
                      fontSize: appFontSize,
                      color: Colors.white,
                    ),
                ),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("${listing["listingdescription"]}",
                    style: TextStyle(
                      //fontSize: 22.0,
                      color: Colors.white,
                    ),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}