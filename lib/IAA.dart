import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_things2/iq.dart';
import 'package:learning_things2/palestine.dart';
void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext contetx){
    return MaterialApp(
      title: "IAA Flag",
      home: IAA(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class IAA extends StatelessWidget{
  const IAA({super.key});
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
              Navigator.push(context,MaterialPageRoute(builder: (context)=>Palestine()));
            } else {
              Navigator.push(context,MaterialPageRoute(builder:(contetx)=>Iraq()));
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
                  color: Color(0xFFFFFFFF),
                  child: SvgPicture.asset(
                    "assets/Image/flags/Flag_of_the_Taliban.svg",
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