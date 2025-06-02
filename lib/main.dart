import 'package:flutter/material.dart';
import 'package:learning_things2/responsivePixel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Apperico',
      debugShowCheckedModeBanner: false,
      home : MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Text(
                  "Name : Shahnawaz Khan",
                  style:TextStyle(
                      color: Colors.white,
                      fontFamily:"",
                      fontSize: respPixel(context,20),
                      backgroundColor: Colors.cyanAccent,
                      fontWeight:FontWeight.w900
                  )
              ),
              SizedBox(width: respPixel(context, 0),height: respPixel(context, 30),),
              Text(
                "Marks : 8.3",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily:"",
                    fontSize: respPixel(context,20),
                    fontStyle: FontStyle.italic,
                    backgroundColor: Colors.cyanAccent
                ),
              )
            ],
          ),
        ),

      ),
    );
  }
}