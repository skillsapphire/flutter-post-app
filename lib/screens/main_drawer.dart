import 'package:awesome/homepage.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../appconstant.dart';

//https://www.youtube.com/watch?v=iX07Xnn4ol8&t=12s
class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {

  var apiRes, categories;

  @override
  void initState() {
    super.initState();
    getCategoriesFromAPI();
  }

  getCategoriesFromAPI() async{
    apiRes = await http.get(apiBaseUrl+"/listingcategory?_fields=id,name");
    //print(apiRes.body);// this is as string response, so it has to be converted to json
    categories = jsonDecode(apiRes.body);
    //print(categories);
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity, //this will take the whole width of the drawer
                padding: EdgeInsets.all(20.0),
                color: Theme.of(context).primaryColor,
                child: Container(
                  margin: EdgeInsets.only(top: 5.0),
                  child: Center(
                    child: Text("Menus", style: TextStyle(fontSize: 22.0, color: Colors.white)),
                  ),
                ), // this will apply the primary color of our theme
              ),
              Container(
                child: apiRes != null ? ListView.builder(
                    shrinkWrap: true, // if not given than ListView will break https://stackoverflow.com/questions/52801201/flutter-renderbox-was-not-laid-out
                    itemCount: categories.length,
                    itemBuilder: (context, index){
                    var category = categories[index];
                    return ListTile(
                      leading: Icon(Icons.arrow_right),
                      title: Text("${category["name"]}", style: TextStyle(fontSize: 18.0)),
                      onTap: (){
                        Navigator.of(context).pop();
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(category: category["id"])));
                      },
                    );
                  }
                ) : Container(margin: EdgeInsets.only(top: 30.0), child: CircularProgressIndicator(backgroundColor: Colors.white)),
              ),
            ],
          ),
      );
  }
}