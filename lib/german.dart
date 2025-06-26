import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:learning_things2/sa.dart';
import 'package:learning_things2/yamen.dart';
void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext contetx){
    return MaterialApp(
      title: "German Flag",
      home: German(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class German extends StatelessWidget{
  const German({super.key});
  @override
  Widget build(BuildContext context){
    final screenSize=MediaQuery.of(context).size;
    print("Height :${screenSize.height}");
    return Scaffold(
      //appBar: AppBar(

      //),
      body: GestureDetector(
        onHorizontalDragUpdate: (details){
          if(details.delta.dx>0) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Saudi()));
          }else {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Yamen()));
          }},
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                width: screenSize.width/3,
                height: (screenSize.height),
                color: Color(0xFF000000),
              ),
            ),
            Positioned(
              top: 0,
              left: screenSize.width/3,
              child: Container(
                width: screenSize.width/3,
                height: (screenSize.height),
                color: Color(0xFFDD0000),
              ),
            ),
            Positioned(
              top: 0,
              left: (screenSize.width/3)*2,
              child: Container(
                width: screenSize.width/3,
                height: screenSize.height,
                color: Color(0xFFFFCE00),
              ),
            )
          ],
        ),
      )
    );
  }
}