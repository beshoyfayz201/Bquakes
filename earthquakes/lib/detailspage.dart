import"package:flutter/material.dart";
import'models/quakes.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart'as Http;
class DetailsPage extends StatefulWidget {
  Quakes quakes;
  DetailsPage(this.quakes);
  @override
   _DetailsPageState createState() => _DetailsPageState();
}


class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[

          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                          colors: [Colors.brown[500],Colors.white]
            )),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child:Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("B\'Q U akes",style:
                           TextStyle(
                           fontFamily: 'ca',
                           color: Colors.white,
                           fontSize: 35
                       ),
                      )
                    ],
                ),
                heightFactor: 30,),
                decoration:new BoxDecoration(
                  borderRadius: BorderRadius.vertical(bottom: new Radius.elliptical(
                  MediaQuery.of(context).size.width*0.8, 30)),
                  color: Colors.grey[100].withOpacity(0.2),
                  boxShadow: [new BoxShadow(blurRadius:500,color: Colors.brown[900],spreadRadius: 20 )],
                      ),
                height: 90,),

                buildText("Location : ",widget.quakes.place,Icons.place),
                buildText("Magnitude : ", widget.quakes.mag,Icons.timeline),
                buildText("Type : ", widget.quakes.type,Icons.search),
                buildText("Status : ", widget.quakes.status,Icons.view_week),
                buildText("Tsuname magnitude : ", widget.quakes.tsunamiMag,Icons.photo_size_select_actual),
                buildText("Coordanatis :   ", widget.quakes.coordinates[0].toString().substring(0,5)+"  |   "+
                  widget.quakes.coordinates[1].toString().substring(0,5)
                  , Icons.map),

              ////////////////////////////////////////


            ],
          )
        ],
      ),

      floatingActionButton:FloatingActionButton(

        isExtended: true,
        backgroundColor: Colors.white70,
          shape: StadiumBorder(side: BorderSide(width: 5,color: Colors.brown[500])),
        child: Icon(Icons.cloud_queue,size: 30,color: Colors.brown,semanticLabel: "More Data",
        ),
        onPressed: launchit
      ),


    );


  }
  //launch url to get more details
  launchit()async{
   await launch(widget.quakes.details);
  }

  //Build text details
  buildText(String tit,String sub,IconData iconData){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Icon(iconData),
          SizedBox(width: 5,),
          Text("|",style: TextStyle(color: Colors.grey),),
          SizedBox(width: 5,),

          Text(tit,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
          Text((sub.length>25)?sub.substring(0,25)+" . . .":sub,style: TextStyle(
              color: Colors.white
              ,fontSize: 15,
              shadows: [Shadow(color: Colors.brown[900],blurRadius: 15)]),
          overflow: TextOverflow.ellipsis,)
        ],
      ),
    );
  }
}
