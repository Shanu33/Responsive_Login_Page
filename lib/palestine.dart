import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:learning_things2/yamen.dart';

import 'IAA.dart';
void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext contetx){
    return MaterialApp(
      title: "Palestinian Flag",
      home: Palestine(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class Palestine extends StatelessWidget{
  const Palestine({super.key});
  @override
  Widget build(BuildContext context){
    final screenSize=MediaQuery.of(context).size;
    return Scaffold(
      //appBar: AppBar(

      //),
        body: GestureDetector(
          onHorizontalDragUpdate: (details){
            if(details.delta.dx>0) {
              Navigator.push(context,MaterialPageRoute(builder:(context)=>Yamen()));
            } else {
              Navigator.push(context,MaterialPageRoute(builder:(context)=>IAA()));
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
                  color: Color(0xFF000000),
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
                left: (screenSize.width/3)*2,
                child: Container(
                  width: screenSize.width/3,
                  height: screenSize.height,  // for vertical swap widht hieght vlaues and swap top left values
                  color: Color(0xFF007A3D),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                child: ClipPath(
                  clipper: TriangleClipper(),
                  child: Container(
                    color: Color(0xFFCE1126),
                    width: screenSize.width,
                    height: (screenSize.height/100)*20, //for Vetical Swap widht hiehgt login
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}
class TriangleClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size){
    Path path =Path();
    path.moveTo(0,0);
    path.lineTo(size.width,0);
    path.lineTo(size.width/2,size.height); //for Vetical Swap lineTo parameter
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper)=>false;
}