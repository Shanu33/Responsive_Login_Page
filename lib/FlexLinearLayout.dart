import 'package:flutter/material.dart';

enum ChangeDirection{
  row,
  column,
  none
}
enum ChildPlacement{
  Horizontal,
  Vertical,
}


class FlexLinearLayout extends StatelessWidget {
  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final TextDirection? textDirection;
  final VerticalDirection verticalDirection;
  final TextBaseline? textBaseline;
  final double spacing;
  final BuildContext Context;
  final direction;
  final childPlacement;

  const FlexLinearLayout({
    Key? key,
    required this.Context,
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline,
    this.spacing = 0.0,
    this.direction=ChangeDirection.none,
    this.childPlacement=ChildPlacement.Horizontal
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    var mySize=MediaQuery.of(Context).size;
    return (childPlacement==ChildPlacement.Horizontal? mySize.width>mySize.height : mySize.width<mySize.height)?
    Column(
        spacing: spacing,
        mainAxisAlignment: mainAxisAlignment,
        mainAxisSize: mainAxisSize,
        textDirection: textDirection,
        textBaseline: textBaseline,
        verticalDirection: verticalDirection,
        crossAxisAlignment: crossAxisAlignment,
        children: direction == ChangeDirection.column? children.reversed.toList():children,

    )
        :Row(
            spacing: spacing,
            mainAxisAlignment: mainAxisAlignment,
            mainAxisSize: mainAxisSize,
            textDirection: textDirection,
            textBaseline: textBaseline,
            verticalDirection: verticalDirection,
            crossAxisAlignment: crossAxisAlignment,
            children: direction == ChangeDirection.row? children.reversed.toList():children,

    );
  }
}