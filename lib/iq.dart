import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_things2/IAA.dart';
import 'package:learning_things2/irn.dart';
import 'package:learning_things2/responsivePixel.dart';
void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext contetx){
    return MaterialApp(
      title: "IRAQ Flag",
      home: Iraq(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class Iraq extends StatelessWidget{
  const Iraq({super.key});
  @override
  Widget build(BuildContext context){
    final screenSize=MediaQuery.of(context).size;
    final aspectRatio=900/600;
    return Scaffold(
      //appBar: AppBar(

      //),
        body: GestureDetector(
          onHorizontalDragUpdate:(details){
            if(details.delta.dx>0) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => IAA()));
            }else {
              Navigator.push(context, MaterialPageRoute(builder:(context)=>Iran()));
            }
          },
          child: Stack(
            children: [
              Center(
                    child: SvgPicture.asset(
                      "assets/Image/flags/iq.svg",
                        width: screenSize.width,
                        height: screenSize.height,
                        fit:BoxFit.cover
                    ),
                  ),
            ],
          ),
        )
    );
  }
}