import 'package:flutter/material.dart';

class ReUsableContainer extends StatelessWidget {
  final Color color;
  final Widget childReUsable;
  final Function onPress;

  ReUsableContainer({@required this.color, this.childReUsable, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: childReUsable,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
