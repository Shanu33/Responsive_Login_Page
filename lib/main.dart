export 'pwa_utils.dart';
import 'package:learning_things2/sreener.dart';

import 'platform_utils.dart';

import 'package:flutter/foundation.dart';
import 'package:device_preview/device_preview.dart';

import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_things2/FlexLinearLayout.dart';
import 'pwa_utils_stub.dart';
import 'package:learning_things2/SliderIndex.dart';
import 'package:learning_things2/respPatt.dart';



enum ScreenMode { portrait, landscape }
ScreenMode getScreenMode(BuildContext context) {
  final size = MediaQuery.of(context).size;
  return size.width >= size.height ? ScreenMode.landscape : ScreenMode.portrait;
}



void main() {

  runApp(const MyApp());
  /*runApp(DevicePreview(
    enabled: true, // Set to false to disable in release
    builder: (context) => MyApp(), // Your actual app
  ));*/
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //useInheritedMediaQuery: true
      // important!
      title: 'Apperico',
      debugShowCheckedModeBanner: false,
      home : MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => MyHomeScreen();
}

class MyHomeScreen extends State<MyHomePage> {

   customSize({required isLandscape}) {
     const horizontalPadding = EdgeInsets.symmetric(horizontal: 10);
     const verticalPaddingWebNative = EdgeInsets.symmetric(vertical: 20, horizontal: 80);
     const defaultPaddingPortrait = EdgeInsets.only( bottom: 20, left: 19, right: 19);
     const androidPotrait = EdgeInsets.only(top: 50, bottom: 10, left: 19, right: 19);
     const iOSPotrait = EdgeInsets.only(top: 25, bottom: 20, left: 19, right: 19);
     const desktopPotrait = EdgeInsets.only(top: 20, bottom: 20, left: 19, right: 19);
     var myPadding;
     var PatWidth;
     var wbFontSize;
     var hiGIFWH;
     var lineFont;
     var bannerImageSize=[];
     var uiElementTopPadding;
     var signOptionDir;
     var isMobile;

    /* if(Screener.isMobileBrowser){
          myPadding=(isLandscape ? verticalPaddingWebNative : defaultPaddingPortrait);
     }
     if(Screener.isBigScreenBrowser){
       myPadding=(isLandscape ? verticalPaddingWebNative : defaultPaddingPortrait);
     }
     if(Screener.isPWA){
       myPadding=(isLandscape ? horizontalPadding : defaultPaddingPortrait);
     }
     if(Screener.isAndroidNative){

     }*/
     if (kIsWeb) {

       myPadding = isStandalonePWA()
           ? (isLandscape ? horizontalPadding : defaultPaddingPortrait)
           : (isLandscape ? verticalPaddingWebNative : defaultPaddingPortrait);

       PatWidth=isStandalonePWA()
           ? (isLandscape?40:12).toDouble()
           : (isLandscape?70:15).toDouble();

       wbFontSize= isStandalonePWA()
           ?(isLandscape? 26:21).toDouble()
           :(isLandscape? 34:20).toDouble();

       hiGIFWH= isStandalonePWA()
           ?(isLandscape?35:30).toDouble()
           :(isLandscape?43:29).toDouble();

       lineFont=isStandalonePWA()
           ?(isLandscape?16:14.5).toDouble()
           :(isLandscape?20:13.5).toDouble();
       signOptionDir=isStandalonePWA()
           ?isLandscape? ChildPlacement.Vertical:ChildPlacement.Horizontal
           :ChildPlacement.Horizontal;
       isMobile=isStandalonePWA()
           ?isLandscape?true:false
           :false;
     }

     if (isAndroid()) {
       myPadding = isLandscape
           ? horizontalPadding
           : androidPotrait;
       PatWidth=(isLandscape?40:11).toDouble();
       wbFontSize=(isLandscape? 26:21).toDouble();
       hiGIFWH=(isLandscape?35:30).toDouble();
       lineFont=(isLandscape?16:14.5).toDouble();
       signOptionDir=isLandscape
           ?ChildPlacement.Vertical
           :ChildPlacement.Horizontal;
     }
     if (isIOS()) {
       myPadding = isLandscape
           ? horizontalPadding
           : iOSPotrait;
       PatWidth=(isLandscape?40:16).toDouble();
       wbFontSize=(isLandscape? 26:21).toDouble();
       hiGIFWH=(isLandscape?35:30).toDouble();
       (isLandscape?16:14.5).toDouble();
       signOptionDir=isLandscape
           ?ChildPlacement.Vertical
           :ChildPlacement.Horizontal;
     }
     if(isWindows() || isMacOS() || isLinux()){
       myPadding= isLandscape
           ? verticalPaddingWebNative
           :desktopPotrait;

       PatWidth=(isLandscape?40:8).toDouble();
       wbFontSize=(isLandscape? 34:20).toDouble();
       hiGIFWH=(isLandscape?43:29).toDouble();
       lineFont=(isLandscape?20:13.5).toDouble();
       signOptionDir=ChildPlacement.Horizontal;
     }

     return [myPadding, PatWidth,wbFontSize, hiGIFWH,lineFont,signOptionDir];
   }

    Widget InputField({required Height, required isLandscape,required text}){
    return SizedBox(
      height: isLandscape?(Height/100)*4.4:(Height/100)*5.1,
      child: TextField(
        textAlignVertical: TextAlignVertical.top,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(bottom: 10,left: 14),
            border: InputBorder.none,
            filled: true,
            fillColor: Color(0xFFF3F7FB),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),
                borderSide: BorderSide(
                  color: Color(0xFFD4D7E3),
                )
            ),
            hintText: text,
            hintStyle: TextStyle(
                fontFamily: "Roboto",
                fontWeight: FontWeight.w100,
                color: Color(0xFF8897AD),
                fontSize:isLandscape?14:12
            )
        ),
      ),
    );}

  Widget HyperLink({required text, required isLandscape, required fontOffset, alignment=Alignment.center,OnTap}){

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: OnTap,
        child: Align(
          alignment: alignment,
          child: Text(
            text,
            style: TextStyle(
                fontFamily: "Roboto",
                fontSize: isLandscape?fontOffset[0].toDouble():fontOffset[1].toDouble(),
                color: Color(0xFF1E4AE9),
                fontWeight: FontWeight.w500
            ),
          ),
        ),
      ),
    )
    ;
  }

  Widget ImageButton({required Height, required Width, required isLandscape , required Image, required textOffset,required widthOffset,required heightOffset}){
    return SizedBox(
      height: isLandscape?(Height/100)*4.56:(Height/100)*4.73,
      width: isLandscape?Width/2:(Width/100)*41.79,
      child: TextButton(
          onPressed: (){},
          style: TextButton.styleFrom(
            padding: EdgeInsets.all(0),
              backgroundColor: Color(0xFFF3F9FA),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(11)
              )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: isLandscape?(Width/100)*1:(Width/100)*3,
            children: [
              SvgPicture.asset(
                Image,
                width: isLandscape?widthOffset[0].toDouble():widthOffset[1].toDouble(),
                height: isLandscape?heightOffset[0].toDouble():heightOffset[1].toDouble(),
              ),
              Text(
                isLandscape?textOffset[0]:textOffset[1],
                style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 13,
                    fontWeight: FontWeight.w100,
                    color: Color(0xFF313957)
                ),
              )
            ],
          )
      ),
    )
    ;
  }

  Widget myText({required text, required isLandscape}){
    return Align(
      alignment: Alignment.bottomLeft,
      child: Text(
        text,
        style: TextStyle(
            fontSize: isLandscape?14:12,
            fontFamily: "Roboto",
            fontWeight: FontWeight.w500
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {

    final Width=MediaQuery.of(context).size.width;
    final Height=MediaQuery.of(context).size.height;
    final mode=getScreenMode(context);
    final flexLower = mode == ScreenMode.landscape ? 1 : 3;
    final isLandscape=mode==ScreenMode.landscape;


    print("Width :$Width\tHeight:$Height");

    final  List<String> imageList=
      isLandscape
      ?["assets/Image/Painting_Of_Flower_Bouquet.jpg",
        "assets/Image/Art.png",
        "assets/Image/Art (1).png",
        "assets/Image/Art (2).png",
        "assets/Image/Art (3).png"]
    :[ "assets/Image/Flower_half.jpg",
        "assets/Image/half_opequw.png",
        "assets/Image/half_heart.png",
        "assets/Image/half_hand.png",
        "assets/Image/half_frame.png"];

    final bannerImage =imageList[SliderIndex.Counter];

    Widget uiWrapper({required Widget child, required EdgeInsets padding}) {
      return isLandscape
          ? SingleChildScrollView(
          padding: padding,
          child: child,
      )
          : Padding(
        padding: padding,
        child: child,
      );
    }


    // TODO: implement build
    return Scaffold(
      //backgroundColor: Color(0xFDFFFFFD),
      body: Container(
        color: Color(0xFDFFFFFD),
        padding:customSize(isLandscape: isLandscape)[0],

        child: FlexLinearLayout(
            Context: context,
            direction: ChangeDirection.row,
            childPlacement: ChildPlacement.Vertical,
            children:[
              Stack(
                children: [
                  // Image background
                  ClipSmoothRect(
                    radius: SmoothBorderRadius(cornerRadius: 18, cornerSmoothing: 1),
                    child: Image.asset(
                      bannerImage,
                      width: isLandscape ? (Width / 100) * 40:Width,
                      height: isLandscape ? Height:(Height / 100) * 21.1 ,
                      fit: isLandscape ? BoxFit.fill : BoxFit.cover,
                    ),
                  ),

                  // Transparent left/right buttons
                  Positioned.fill(
                    child: Row(
                      children: [
                        // Left tappable area
                        Expanded(
                          child: GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {
                              setState(() {
                                SliderIndex.getIndex("-", 4);
                              });
                            },
                            child: Container(), // Fully transparent
                          ),
                        ),
                        // Right tappable area
                        Expanded(
                          child: GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {
                              setState(() {
                                SliderIndex.getIndex("+", 4);
                              });
                            },
                            child: Container(), // Fully transparent
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),


              SizedBox(width: isLandscape?(Width/100)*14:0),

              Expanded(
                flex: flexLower,
                child: uiWrapper(
                  padding: isLandscape?EdgeInsets.only(top: (Height/100)*4,)
                      : EdgeInsets.only(top: (Height/100)*2.6),

                  child: Column(
                    children: [
                      Row(
                        spacing: 3,
                        children: [
                          Text(
                            "Welcome Back",
                            style: TextStyle(
                              fontFamily: "SansSarifRounded",
                              fontSize:customSize(isLandscape: isLandscape)[2],
                              fontWeight: FontWeight.bold
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.only(bottom: 9),
                            child: Image.asset(
                              "assets/Image/hiFi.gif",
                              width: customSize(isLandscape: isLandscape)[3],
                              height: customSize(isLandscape: isLandscape)[3],
                            ),
                          )
                        ],
                      ) ,

                      SizedBox(height: isLandscape?(Height/100)*2.46:(Height/100)*0.4,),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Today is new day. It's your day. You shape it.Sign in to start your projects.",
                          style: TextStyle(
                            fontSize: customSize(isLandscape: isLandscape)[4],
                            fontFamily: "SansSarifRegular",
                          ),
                          maxLines: 3,
                        ),
                      ),

                      SizedBox(height: isLandscape?(Height/100)*4.21:(Height/100)*2.2,),

                      myText(text: "Email", isLandscape: isLandscape),

                      InputField(
                          Height: Height,
                          isLandscape: isLandscape,
                          text: "Example@email.com"),

                      SizedBox(height: isLandscape?(Height/100)*2.2:(Height/100)*1.6,),

                      myText(text: "Password", isLandscape: isLandscape),

                      InputField(
                          Height: Height,
                          isLandscape: isLandscape,
                          text: "At least 8 characters"),

                      SizedBox(height: isLandscape?(Height/100)*2.1:(Height/100)*1.59,),

                      HyperLink(
                          text: "Forgot Password?",
                          isLandscape: isLandscape,
                          fontOffset: [14,12],
                          alignment: Alignment.centerRight,OnTap: (){}),

                      SizedBox(height: isLandscape?(Height/100)*2.1:(Height/100)*1.59,),

                      SizedBox(
                        height: isLandscape?(Height/100)*4.56:(Height/100)*5.15,
                        width: isLandscape?Width/2:Width,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Color(0xFF162D3A),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )
                          ),
                            onPressed: (){},
                            child: Text(
                              "Sign in",
                              style: TextStyle(
                                color: Color(0xFFFFFFFF),
                                fontSize: isLandscape?17:13,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w100
                              ),
                            )
                        ),
                      ),

                      SizedBox(height: isLandscape?(Height/100)*4.21:(Height/100)*4.5,),

                      patternedLine(
                          screenWidth: Width,
                          textStyle:TextStyle(
                            fontFamily: "Roboto",
                            fontSize: isLandscape ? 14 : 12,
                            fontWeight: FontWeight.w100,
                            color: const Color(0xFF294957),
                          ),
                          text:isLandscape ? '    Or    ' : '    Or sign in with    ',
                        pattern: "\u2500",
                        charWidth: customSize(isLandscape: isLandscape)[1]
                      ),

                      SizedBox(height: isLandscape?(Height/100)*2.1:(Height/100)*2.8,),

                      FlexLinearLayout(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        childPlacement: customSize(isLandscape: isLandscape)[5],
                        Context: context,
                        children: [
                          ImageButton(
                              Height: Height,
                              Width: Width,
                              isLandscape: isLandscape,
                              Image: "assets/Image/google_icon.svg",
                              textOffset: ["Sign in with Google    ","Google"],
                              widthOffset: [24,20],
                            heightOffset: [24,20]
                          ),

                          SizedBox(
                            width: !isLandscape?(Width/100)*4.10:null,
                            height: isLandscape?(Height/100)*1.5:null,
                          ),

                          ImageButton(
                              Height: Height,
                              Width: Width,
                              isLandscape: isLandscape,
                              Image:"assets/Image/Facebook Icon.svg",
                              textOffset: ["Sign in with Facebook","Facebook"],
                              widthOffset: [26.5,23],
                              heightOffset: [26.5,23]
                          ),

                        ]
                      ),
                      SizedBox(
                        height: isLandscape?(Height/100)*4.21:(Height/100)*2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't you have an account?",
                            style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: isLandscape?15.5:13.5,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF313957)
                            ),
                          ),

                          HyperLink(text: "Sign up", isLandscape: isLandscape, fontOffset: [15.5,13.5],OnTap: (){}),

                        ],
                      )
                    ],
                  ),
                ),
              ),

              SizedBox(
                width: isLandscape?(Width/100)*14:0,
              ),

            ]),
      )
    );
  }
}
