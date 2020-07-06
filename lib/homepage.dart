import 'dart:convert';

import 'package:awesome/detailpage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'appconstant.dart';

class HomePage extends StatefulWidget{

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //var apiEndpoint = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Non_Alcoholic";
  //var apiUrl = "https://jsonplaceholder.typicode.com/posts";
  var apiRes, posts;

  @override
  void initState() {
    super.initState();
    getDataFromAPI();
  }

  getDataFromAPI() async{
    apiRes = await http.get(apiBaseUrl+"/");
    //print(apiRes.body);// this is as string response, so it has to be converted to json
    posts = jsonDecode(apiRes.body);
    //print(posts);
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: LinearGradient(colors: [
          appColor, Colors.orange
        ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          title: Text("Listing App"),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
        ),
        body: Center(
           child: apiRes != null ? ListView.builder( // 0
          /*1*/ // child: apiRes != null ? GridView.builder(
          /*2*/ // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          // uncomment 1 and 2 and comment 0 to see GridView and vice versa to see ListView 
            itemCount: posts.length,
            itemBuilder: (context, index){
              var post = posts[index];
              return ListTile(
                leading: Hero(
                tag: post["id"],
                child: CircleAvatar(backgroundImage: NetworkImage("https://jssors8.azureedge.net/demos/img/gallery/720x480/006.jpg"))),
                title: Text("${post["title"]}",
                  style: TextStyle(
                    fontSize: appFontSize,
                    color: Colors.white,
                  ),
                ),
                subtitle: Text("${post["id"]}",
                  style: TextStyle(
                    //fontSize: 22.0,
                    color: Colors.white,
                  ),
                ),
                onTap: (){
                  // https://www.youtube.com/watch?v=1b06d2Ld8C4&feature=youtu.be
                  // check 1.09 min for dialog popup
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(post: post)));
                },
              );
            }
          ) : CircularProgressIndicator(backgroundColor: Colors.white,)
        ),
      ),
    );
  }
}
