import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_things2/FlexLinearLayout.dart';
import 'package:learning_things2/ScreenSize.dart';
import 'package:learning_things2/SliderIndex.dart';

import 'FlagTraingle.dart';

void main(){
  /*WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp]
  ).then((_){
  runApp(const MyApp());});
  */
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "CardView Test",
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=>HomePage();
}
class HomePage extends State<HomeScreen>{

  @override
  Widget build(BuildContext context){
    final screenSize=MediaQuery.of(context).size;
    final cardWidth=screenSize.width-((screenSize.width/100)*10.0);
    final cardHeight=screenSize.height-((screenSize.height/100)*10.0);

    final List<Widget> cardBuilders = [
      Card1(cardWidth,cardHeight,context),
      Card2(cardWidth,cardHeight,context),
      Card3(cardWidth,cardHeight,context),
      Card4(cardWidth,cardHeight),
      Card5(cardWidth,cardHeight,context),
      Card6(cardWidth,cardHeight,context),
      Card7(cardWidth,cardHeight)
    ];

    UpdateImage({required swipeDirection}){
      if(swipeDirection>0){
        setState(() {
          SliderIndex.getIndex("+",6);
        });
      }
      else {
        setState(() {
          SliderIndex.getIndex("-",6);
        });
      }
    }
    return Scaffold(
      body:Center(
        child: GestureDetector(
          onHorizontalDragUpdate: (details){
            UpdateImage(swipeDirection: details.delta.dx);
          },
          child: cardBuilders[SliderIndex.Counter]
        ),
      )
    );

  }

  getColor({cardWidth, cardHeight, cl1,cl2}){
    var temp;
    if(cardWidth<=cardHeight){
      temp=cl1;
      cl1=cl2;
      cl2=temp;
    }
    return [cl1 ,cl2];
  }

  Widget Card1(cardWidth, cardHeight, context){
    return SizedBox(
      width: cardWidth,
      height: cardHeight,
      child: Card(
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)
        ),
        elevation: 20,
        child: FlexLinearLayout(
            Context: context,
            children: [
              Expanded(child: Container(color: Color(0xFFCE1126))),
              Expanded(child: Container(color: Color(0xFFFFFFFF))),
              Expanded(child: Container(color: Color(0xFF000000)))
            ]
        ),
      ),
    );
  }

  Widget Card2(cardWidth, cardHeight, context){
    return  SizedBox(
      width: cardWidth,
      height: cardHeight,
      child: Card(
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        elevation: 20,
        child:FlexLinearLayout(
            Context: context,
            children:[
              Expanded(child: Container(color: Color(0xFF000000),),),
              Expanded(child: Container(color: Color(0xFFDD0000),),),
              Expanded(child: Container(color: Color(0xFFFFCE00),),)
            ]
        ),
      ),
    );
  }

  Widget Card3(cardWidth, cardHeight, context){
    return  SizedBox(
      width: cardWidth,
      height: cardHeight,

      child: Card(
          clipBehavior: Clip.hardEdge,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
          ),
          elevation: 20,
          child: Stack(
              children: [
                FlexLinearLayout(
                    Context: context,
                    children:[
                      Expanded(child: Container(color: Color(0xFF000000))),
                      Expanded(child: Container(color: Color(0xFFFFFFFF))),
                      Expanded(child: Container(color: Color(0xFF007A3D))),
                    ]
                ),
                Positioned(
                  top:0,
                  left: 0,
                  child: ClipPath(
                    clipper: TriangleClipper(context:context),
                    child: Container(
                      color: Color(0xFFCE1126),
                      width: ScreenSize(cardWidth,cardHeight)[0],
                      height: ScreenSize(cardWidth,cardHeight)[1],
                    ),
                  ),
                ),
              ]
          )
      ),
    );
  }


  Widget Card4(cardWidth, cardHeight, {context}){
    return  SizedBox(
      width: cardWidth,
      height: cardHeight,

      child: Card(
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
        ),
        elevation: 20,
        color: Color(0xFFFFFFFF),
        child: SvgPicture.asset(
          cardWidth>cardHeight?"assets/Image/flags/IAA.svg":"assets/Image/flags/Flag_of_the_Taliban.svg",
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget Card5(cardWidth, cardHeight, context){
    return  SizedBox(
      width: cardWidth,
      height: cardHeight,
      child: Card(
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
        ),
        elevation: 20,
        //color: Color(0xFFFFFFFF),
        child: Stack(
            children: [
              FlexLinearLayout(
                Context: context,
                children: [
                  Expanded(child: Container(color: Color(getColor(
                      cardWidth: cardWidth,
                      cardHeight: cardHeight,
                      cl1: 0xFFcd1125,
                      cl2: 0xFF000000)[0]
                  ))),
                  Expanded(child: Container(color: Color(0xFFFFFFFF))),
                  Expanded(child: Container(color: Color(getColor(
                      cardWidth:cardWidth, cardHeight: cardHeight,
                      cl1: 0xFFcd1125,cl2: 0xFF000000)[1]
                  )))
                ],
              ),
              Center(
                child: SvgPicture.asset(
                  cardWidth>cardHeight?"assets/Image/flags/iqLandScap.svg":"assets/Image/flags/iq.svg",
                  width: cardWidth,
                  height: cardHeight,
                  fit: BoxFit.fill,
                ),
              ),
            ]
        ),
      ),
    );
  }

  Widget Card6(cardWidth, cardHeight, context){
    return  SizedBox(
      width: cardWidth,
      height: cardHeight,
      child: Card(
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
        ),
        elevation: 20,
        //color: Color(0xFFFFFFFF),
        child: Stack(
            children: [
              FlexLinearLayout(
                Context: context,
                children: [
                  Expanded(
                      flex:2,
                      child: Container(
                          //width: cardWidth<=cardHeight? (cardWidth/100)*35:cardHeight/3,
                         /* color: Color(getColor(
                              cardWidth: cardWidth,
                              cardHeight: cardHeight,
                              cl1: 0xFF239F40,
                              cl2: 0xFFDA0000)[0])*/
                      )
                  ),
                  Expanded(
                      child: Container(
                          //width: cardWidth<=cardHeight? (cardWidth/100)*30:cardHeight/3,
                         // color: Color(0xFFFFFFFF)
                      )
                  ),
                  Expanded(
                      flex:2,
                      child: Container(
                          //width: cardWidth<=cardHeight? (cardWidth/100)*35:cardHeight/3,
                         /* color: Color(getColor(
                              cardWidth: cardWidth,
                              cardHeight: cardHeight,
                              cl1: 0xFF239F40,
                              cl2: 0xFFDA0000)[1]
                          )*/
                      )
                  )
                ],
              ),
              Center(
                child: SvgPicture.asset(
                  cardWidth>cardHeight?"assets/Image/flags/irLandScap.svg":"assets/Image/flags/ir.svg",
                  fit: BoxFit.fill,
                ),
              ),
            ]
        ),
      ),
    );
  }

  Widget Card7(cardWidth, cardHeight, {context}){
    return  SizedBox(
      width: cardWidth,
      height: cardHeight,
      child: Card(
        color: Color(0xFF005430),
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
        ),
        elevation: 20,
        child: SvgPicture.asset(
          cardWidth>cardHeight?"assets/Image/flags/saLandScap.svg":"assets/Image/flags/sa.svg",
          fit: BoxFit.fill,
        ),
      ),
    );
  }

}

