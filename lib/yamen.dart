import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:learning_things2/german.dart';
import 'package:learning_things2/palestine.dart';
void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext contetx){
    return MaterialApp(
      title: "Yamen Flag",
      home: Yamen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class Yamen extends StatelessWidget{
  const Yamen({super.key});
  @override
  Widget build(BuildContext context){
    final screenSize=MediaQuery.of(context).size;
    return Scaffold(
      //appBar: AppBar(

      //),
        body: GestureDetector(
          onHorizontalDragUpdate: (details){
            if(details.delta.dx>0) {
              Navigator.push(context,MaterialPageRoute(builder:(context)=>German()));
            } else {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Palestine()));
            }
          },
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  width: screenSize.width/3,
                  height: (screenSize.height),
                  color: Color(0xFFCE1126),
                ),
              ),
              Positioned(
                top: 0,
                left: screenSize.width/3,
                child: Container(
                  width: screenSize.width/3,
                  height: (screenSize.height),
                  color: Color(0xFFFFFFFF),
                ),
              ),
              Positioned(
                top: 0,
                left:(screenSize.width/3)*2,
                child: Container(
                  width: screenSize.width/3,
                  height: screenSize.height,
                  color: Color(0xFF000000),
                ),
              )
            ],
          ),
        )
    );
  }
}