import 'package:earthquakes/detailspage.dart';
import 'package:earthquakes/models/quakes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flare_dart/actor.dart';
import'Apage.dart';
import 'dart:convert';
import 'dart:async';
Map _data;
List _features;
void main() async{
   _data=await getdata();
   _features=_data['features'];

  runApp(MaterialApp(
    theme: ThemeData.dark(),
    home:Spl() ,
  ));
}

class Apage extends StatefulWidget {
  ApageState createState() => new ApageState();
}

//getting the data
Future<Map> getdata() async {
  String url =
      "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_hour.geojson";
  http.Response response = await http.get(url);
  return json.decode(response.body);
}


class ApageState extends State<Apage> {
  @override


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(

      body: Stack(
        children: <Widget>[

          Container(
            color:Colors.white,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset("assets/images/a.png",
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              colorBlendMode: BlendMode.darken,
              filterQuality: FilterQuality.high,
              fit: BoxFit.fitHeight,),
            ),
          ),

          Column(
            children: <Widget>[
              buildAppTitle(),
              Expanded(


               child: ListView.builder(
                 itemCount: _features.length,
                itemBuilder: (BuildContext context,int index) {
                var dat=new DateTime.fromMillisecondsSinceEpoch(_features[index]['properties']['time']);
                 return GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                      new MaterialPageRoute(builder: (context)=>  DetailsPage(
                  new Quakes(
                  _features[index]['properties']['type'],
                  _features[index]['properties']['mag'].toString(),
                  _features[index]['properties']['place'],
                  _features[index]['properties']['url'],
                  _features[index]['properties']['status'],
                  _features[index]['properties']['tsunami'].toString(),
                  _features[index]["geometry"]["coordinates"]
                  ))));
                                 },
                   //__________build the List of quakes__________

                    child: Card(
                     color: Colors.brown[400].withOpacity(0.2),
                     child: new ListTile(



                      title:  Text(_features[index]['properties']['place'].toString(),textScaleFactor: 1.2,style: TextStyle(

                         fontWeight: FontWeight.bold
                         ),),
                         subtitle: Row(
                         children: <Widget>[
                            Text("${dat} "),
                            Icon(Icons.access_alarms,
                         color: Colors.grey[300],
                         size: 14,)
                         ],
                         ),
                         leading: Container(
                          decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          border: Border.all(color: Colors.grey,width: 1.7)
                          ),
                           child: CircleAvatar(backgroundColor: Colors.lightBlue[700],

                             child: Text(
                               //Text Control
                            (_features[index]['properties']['mag'].toString().length>4)?
                            _features[index]['properties']['mag'].toString().substring(0,3):
                            _features[index]['properties']['mag'].toString()


                           )
                             ,radius: 20,foregroundColor: Colors.white,),
                           ),
                           ),
                           ),
                           );
                           },

               ),
              )
              ,

            ],
          )
        ],
      ),
    );
  }

  //some Creative new Widget
  Widget buildAppTitle(){
    return
    Container(
      child:Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("B\'Q U akes",
            style:TextStyle(
             fontFamily: 'ca',
             color: Colors.white,
             fontSize: 35
        ),
        )],
         ),
        heightFactor: 30,),
        decoration:new BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: new Radius.elliptical(
        MediaQuery.of(context).size.width*0.8, 30)),
        color: Colors.grey[100].withOpacity(0.2),
        boxShadow: [new BoxShadow(blurRadius:500,color: Colors.green[900],spreadRadius: 20 )],
        ),
      height: 90,);
  }
}
