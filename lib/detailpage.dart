import 'package:flutter/material.dart';
import 'appconstant.dart';

class DetailPage extends StatelessWidget {

  final post;

  const DetailPage({Key key, @required this.post}) : super(key: key);

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
          title: Text(post["title"]),
          elevation: 0.0,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Hero(
                  tag: post["id"],
                  child: CircleAvatar(
                    radius: 100.0,
                    backgroundImage: NetworkImage("https://jssors8.azureedge.net/demos/img/gallery/720x480/006.jpg")),
              ),
              SizedBox(height: 10.0,),
              Text("Post Id: ${post["id"]}",
                  style: TextStyle(
                    fontSize: appFontSize,
                    color: Colors.white,
                  ),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("${post["title"]}",
                    style: TextStyle(
                      fontSize: appFontSize,
                      color: Colors.white,
                    ),
                ),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("${post["body"]}",
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