import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import'package:avatar_glow/avatar_glow.dart';
import 'package:nice_button/nice_button.dart';
class Spl extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 30,
        backgroundColor: Colors.green[600].withOpacity(0.9),
        title: Text("B\'Q U akes",style:
         TextStyle(
          fontFamily: 'ca',
          color: Colors.white,
          fontSize: 35,


      ),)
        ,centerTitle: true
        ,),
        body:Stack(
          children: <Widget>[
//            Image.asset("assets/images/xz.jpeg",height: MediaQuery.of(context).size.height,
//              fit: BoxFit.fitHeight,),
            Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.white,Colors.blue[50],]
                  //  ,begin:Alignment.bottomRight
                  //,end: Alignment.topLeft
              )
            ),

              padding: EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  Expanded(
                      flex: 2
                      ,  child:AvatarGlow(
                    endRadius: 230,
                        glowColor: Colors.blue[300],



                        child: FlareActor(
                    "assets/ws.flr",
                    animation: "roll",
                  ),
                      )
                  ),
                  Expanded(
                    flex:1,
                    child: NiceButton(
                      background: Colors.green,
                      onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder:
                          (BuildContext context)=>Apage()));},
                      text: "check quakes",

                      gradientColors: [Colors.green[400],Colors. blue[800]],
                    ),
                  ),


                ],
              ),
            )
          ],
        )
    );
  }
}