import 'dart:convert';

import 'package:awesome/detailpage.dart';
import 'package:awesome/screens/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'appconstant.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget{

  var category;
  HomePage({Key key, @required this.category}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //var apiEndpoint = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Non_Alcoholic";
  //var apiUrl = "https://jsonplaceholder.typicode.com/posts";
  var apiRes, listings;

  @override
  void initState() {
    super.initState();
    //print(widget.category);
    if(widget.category == null){
      widget.category = 4;//default load doctors
    }
    getListingsFromAPI();
  }

  getListingsFromAPI() async{
    apiRes = await http.get(apiBaseUrl+"/listing?per_page=30&listingcategory=${widget.category}");
    //print(apiRes.body);// this is as string response, so it has to be converted to json
    listings = jsonDecode(apiRes.body);
    //print(listings);
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
          title: Text("Listings"),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
        ),
        drawer: MainDrawer(),
        body: Center(
           child: apiRes != null ? ListView.builder( // 0
          /*1*///  child: apiRes != null ? GridView.builder(
          /*2*///  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          // uncomment 1 and 2 and comment 0 to see GridView and vice versa to see ListView 
            itemCount: listings.length,
            itemBuilder: (context, index){
              var listing = listings[index];
              return ListTile(
                leading: Hero(
                tag: listing["id"],
                child: CircleAvatar(backgroundImage: NetworkImage("https://jssors8.azureedge.net/demos/img/gallery/720x480/006.jpg"))),
                title: Text("${listing["listingtitle"]}",
                  style: TextStyle(
                    fontSize: appFontSize,
                    color: Colors.white,
                  ),
                ),
                subtitle: Text("${listing["listingdescription"]}",
                  style: TextStyle(
                    //fontSize: 22.0,
                    color: Colors.white,
                  ),
                ),
                onTap: (){
                  // https://www.youtube.com/watch?v=1b06d2Ld8C4&feature=youtu.be
                  // check 1.09 min for dialog popup
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(listing: listing)));
                },
              );
            }
          ) : CircularProgressIndicator(backgroundColor: Colors.white,)
        ),
      ),
    );
  }
}
