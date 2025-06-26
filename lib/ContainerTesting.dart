import "package:flutter/material.dart";
import 'package:dotted_border/dotted_border.dart';
import 'package:flexi_border/flexi_border.dart';
import 'package:learning_things2/responsivePixel.dart';
import 'dart:ui' as ui;

void main(List<String> args){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:"ContainerTest",
      debugShowCheckedModeBanner:false,
      home:HomePage()
    );
  }

}
class HomePage extends StatelessWidget{

  final double LEFT_LINE_VALUE=0.74;
  final double STWIDTH=20;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      /*appBar:AppBar(
        backgroundColor:Colors.black,
        title:Center(
            child:Text(
                "This is AppBar",
                style:TextStyle(color:Colors.white,fontStyle:FontStyle.italic,wordSpacing:10,fontSize:40)
            )
      )),*/

      body:
      Container(
        decoration:BoxDecoration(
            gradient:LinearGradient(colors: [Color(0xFF0f2027),Color(0xFF203a43),Color(0xFF2c5364)],
                begin:Alignment.topLeft,
                end:Alignment.bottomRight,
                stops:[respPixel(context,0.3),respPixel(context, 0.8),respPixel(context, 50)]
          )
        ),
        child: Align(
            alignment:Alignment.center,
            child: FlexiBorder(
                borderMode: BorderMode.full,
                drawRight: false,
                topStartOffset:4.8,
                topEndOffset: -300/2,
                leftStartOffset:4.8,
                rightStartOffset: 4.8,
                bottomEndOffset: 4.8,
                bottomStartOffset: -300/2,
                strokeWidth: 2,
                dashPattern: [5,5],
                borderColor: Colors.white,

                child: Container(
                    width:300,
                    height:90,
                    decoration: BoxDecoration(
                      color:Colors.black,
                    ),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/Image/hi.gif',
                          width: 70,
                          height:70,
                        ),
                        SizedBox(
                          width: 10,
                          height: 90,

                        ),
                        Text("I'm Shanu",
                          style: TextStyle(
                            fontSize: 40,
                            color: Colors.white
                          ),
                        )
                      ],
                    ),
                  )
                      ),
            )
    ),
    );
  }
}

class MyPaint extends CustomPainter{

  @override
  void paint(Canvas canva, Size size){

  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate)=> false;
}