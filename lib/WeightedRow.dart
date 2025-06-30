import 'package:flutter/material.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_things2/FlexLinearLayout.dart';
import 'package:learning_things2/SliderIndex.dart';
import 'package:learning_things2/respPatt.dart';
import 'ScreenSizer.dart';

enum ScreenMode { portrait, landscape }

ScreenMode getScreenMode(BuildContext context) {
  final size = MediaQuery.of(context).size;
  return size.width >= size.height ? ScreenMode.landscape : ScreenMode.portrait;
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Apperico',
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => MyHomeScreen();
}

class MyHomeScreen extends State<MyHomePage> {
  Widget inputField({required String text}) {
    return SizedBox(
      height: ScreenSizeHelper.h(5.1),
      child: TextField(
        textAlignVertical: TextAlignVertical.top,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(bottom: ScreenSizeHelper.h(1.2), left: ScreenSizeHelper.w(3)),
          border: InputBorder.none,
          filled: true,
          fillColor: const Color(0xFFF3F7FB),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: const BorderSide(color: Color(0xFFD4D7E3)),
          ),
          hintText: text,
          hintStyle: TextStyle(
            fontFamily: "Roboto",
            fontWeight: FontWeight.w100,
            color: const Color(0xFF8897AD),
            fontSize: ScreenSizeHelper.sp(13),
          ),
        ),
      ),
    );
  }

  Widget hyperlink({required String text, required double fontSize, Alignment alignment = Alignment.center, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Align(
        alignment: alignment,
        child: Text(
          text,
          style: TextStyle(
            fontFamily: "Roboto",
            fontSize: ScreenSizeHelper.sp(fontSize),
            color: const Color(0xFF0175C2),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget imageButton({required String asset, required String text, required double width, required double height}) {
    return SizedBox(
      height: ScreenSizeHelper.h(5),
      width: ScreenSizeHelper.w(42),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          backgroundColor: const Color(0xFFF3F9FA),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(11),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              asset,
              width: ScreenSizeHelper.w(width),
              height: ScreenSizeHelper.h(height),
            ),
            SizedBox(width: ScreenSizeHelper.w(2)),
            Text(
              text,
              style: TextStyle(
                fontFamily: "Roboto",
                fontSize: ScreenSizeHelper.sp(13),
                fontWeight: FontWeight.w100,
                color: const Color(0xFF313957),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget labeledText(String label) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Text(
        label,
        style: TextStyle(
          fontSize: ScreenSizeHelper.sp(13),
          fontFamily: "Roboto",
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenSizeHelper.init(context);
    final isLandscape = ScreenSizeHelper.orientation == Orientation.landscape;

    void updateImage(double swipeDirection) {
      setState(() {
        SliderIndex.getIndex(swipeDirection > 0 ? "+" : "-", 4);
      });
    }

    final List<String> imageList = isLandscape
        ? [
      "assets/Image/Painting_Of_Flower_Bouquet.jpg",
      "assets/Image/Art.png",
      "assets/Image/Art (1).png",
      "assets/Image/Art (2).png",
      "assets/Image/Art (3).png"
    ]
        : [
      "assets/Image/half_opequw.png",
      "assets/Image/Flower_half.jpg",
      "assets/Image/half_heart.png",
      "assets/Image/half_hand.png",
      "assets/Image/half_frame.png"
    ];

    final bannerImage = imageList[SliderIndex.Counter];

    return Scaffold(
      body: Container(
        color: const Color(0xFDFFFFFD),
        padding: EdgeInsets.symmetric(
          vertical: ScreenSizeHelper.h(0),
          horizontal: ScreenSizeHelper.w(isLandscape ? 8 : 5),
        ),
        child: FlexLinearLayout(
          Context: context,
          direction: ChangeDirection.row,
          childPlacement: ChildPlacement.Vertical,
          children: [
            GestureDetector(
              onHorizontalDragUpdate: (details) => updateImage(details.delta.dx),
              child: ClipSmoothRect(
                radius: SmoothBorderRadius(cornerRadius: 18, cornerSmoothing: 1),
                child: Image.asset(
                  bannerImage,
                  width: isLandscape ? ScreenSizeHelper.w(40) : ScreenSizeHelper.width,
                  height: isLandscape ? ScreenSizeHelper.height : ScreenSizeHelper.h(21),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: isLandscape ? ScreenSizeHelper.w(14) : 0),
            Expanded(
              flex: isLandscape ? 1 : 3,
              child: Padding(
                padding: EdgeInsets.only(top: ScreenSizeHelper.h(isLandscape ? 10 : 2.6)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Welcome Back",
                          style: TextStyle(
                            fontFamily: "SansSarifRounded",
                            fontSize: ScreenSizeHelper.sp(28),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: ScreenSizeHelper.h(1)),
                          child: Image.asset(
                            "assets/Image/hiFi.gif",
                            width: ScreenSizeHelper.w(10),
                            height: ScreenSizeHelper.w(10),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: ScreenSizeHelper.h(2)),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Today is new day. It's your day. You shape it. Sign in to start your projects.",
                        style: TextStyle(
                          fontSize: ScreenSizeHelper.sp(14),
                          fontFamily: "SansSarifRegular",
                        ),
                        maxLines: 3,
                      ),
                    ),
                    SizedBox(height: ScreenSizeHelper.h(4)),
                    labeledText("Email"),
                    inputField(text: "Example@email.com"),
                    SizedBox(height: ScreenSizeHelper.h(2)),
                    labeledText("Password"),
                    inputField(text: "At least 8 characters"),
                    SizedBox(height: ScreenSizeHelper.h(2)),
                    hyperlink(text: "Forgot Password?", fontSize: 13, alignment: Alignment.centerRight, onTap: () {}),
                    SizedBox(height: ScreenSizeHelper.h(2)),
                    SizedBox(
                      height: ScreenSizeHelper.h(5),
                      width: ScreenSizeHelper.w(isLandscape ? 50 : 100),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: const Color(0xFF162D3A),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Sign in",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenSizeHelper.sp(14),
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: ScreenSizeHelper.h(4)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                       ],
                    ),

                    SizedBox(height: ScreenSizeHelper.h(2.8)),
                    FlexLinearLayout(
                      Context: context,
                      children: [
                        imageButton(asset: "assets/Image/google_icon.svg", text: "Google", width: 6, height: 6),
                        SizedBox(width: ScreenSizeHelper.w(4)),
                        imageButton(asset: "assets/Image/Facebook Icon.svg", text: "Facebook", width: 7, height: 7),
                      ],
                    ),
                    SizedBox(height: ScreenSizeHelper.h(2.5)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't you have an account?",
                          style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: ScreenSizeHelper.sp(13),
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF313957),
                          ),
                        ),
                        hyperlink(text: "Sign up", fontSize: 13.5, onTap: () {}),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}