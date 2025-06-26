import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_things2/german.dart';
import 'package:learning_things2/irn.dart';
void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext contetx){
    return MaterialApp(
      title: "SAUDI Flag",
      home: Saudi(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class Saudi extends StatelessWidget{
  const Saudi({super.key});
  @override
  Widget build(BuildContext context){
    final screenSize=MediaQuery.of(context).size;
    print("Height :${screenSize.height}");
    return Scaffold(
      //appBar: AppBar(

      //),
        body: GestureDetector(
          onHorizontalDragUpdate:(details){
            if(details.delta.dx>0) {
              Navigator.push(context,MaterialPageRoute(builder:(context)=>Iran()));
            } else {
              Navigator.push(context,MaterialPageRoute(builder:(context)=>German()));
            }
          },
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  width: screenSize.width,
                  height: screenSize.height,
                  color: Color(0xFF005430),
                  child: SvgPicture.asset(
                    "assets/Image/flags/sa.svg",
                    width: screenSize.width,
                    height: screenSize.height,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}