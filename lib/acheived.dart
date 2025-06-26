import "package:flutter/material.dart";
import 'package:dotted_border/dotted_border.dart';
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

  @override
  Widget build(BuildContext context){
    return Scaffold(

      body:
      Container(
          decoration:BoxDecoration(
              gradient:LinearGradient(colors: [Color(0xFF0f2027),Color(0xFF203a43),Color(0xFF2c5364)],
                  begin:Alignment.topLeft,
                  end:Alignment.bottomRight,
                  stops:[0.3,0.8,50]
              )
          ),
          child: Align(
            alignment:Alignment.center,
            child: DottedBorder(
                color:Colors.white,
                dashPattern:[1,0],
                strokeWidth:respPixel(context, 40),
                strokeCap: StrokeCap.square,
                radius: Radius.circular(0),
                customPath:(size){
                  Path path= Path();
                  path.moveTo(0, 0);
                  path.lineTo(size.width, 0); //top ;ine
                  path.moveTo(0, 0);
                  path.lineTo(0, size.height); //left line
                  path.moveTo(size.width,0);
                  path.lineTo(size.width,size.height );  //right line
                  path.moveTo(0,size.height);
                  path.lineTo(size.width,size.height ); //bottom line
                  return path;
                },
                child: Container(
                  width:respPixel(context, 450),
                  height:respPixel(context, 90),
                  decoration: BoxDecoration(
                    color:Colors.black,
                    borderRadius:BorderRadius.only(
                        topLeft: Radius.circular(0),
                        bottomLeft: Radius.circular(0)
                    ),
                  ),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/Image/hi.gif'),
                      SizedBox(
                          width: 20,
                          height: respPixel(context, 90)
                      ),
                      Text("I'm Shanu",
                        style: TextStyle(
                            fontSize: respPixel(context, 60),
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