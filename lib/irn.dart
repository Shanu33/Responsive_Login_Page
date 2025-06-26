import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_things2/iq.dart';
import 'package:learning_things2/sa.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "IRAN Flag",
      home: const Iran(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Iran extends StatelessWidget {
  const Iran({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final aspectRatio = 630 / 360; // Based on the SVG's original dimensions

    return Scaffold(
      body: GestureDetector(
        onHorizontalDragUpdate:(details){
          if(details.delta.dx>0) {
            Navigator.push(context,MaterialPageRoute(builder:(contetx)=>Iraq()));
          } else {
            Navigator.push(context, MaterialPageRoute(builder:(context)=>Saudi()));
          }
        },
        child: Stack(
          children: [
            Center(
              child: SvgPicture.asset(
                "assets/Image/flags/ir.svg",
                width: screenSize.width,
                height: screenSize.height,
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
