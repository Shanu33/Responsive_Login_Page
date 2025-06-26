import 'package:flutter/cupertino.dart';

class TriangleClipper extends CustomClipper<Path>{
  final BuildContext context;
  TriangleClipper({required this.context});
  @override
  Path getClip(Size size){
    Path path =Path();
    path.moveTo(-2,-2);

    if(MediaQuery.of(context).size.width<MediaQuery.of(context).size.height) {
      path.lineTo(size.width, -2);
      path.lineTo(size.width/2, size.height);
    }
    else{
      path.lineTo(size.width, size.height/2);
      path.lineTo(-2, size.height);
    }
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper)=>false;
}
