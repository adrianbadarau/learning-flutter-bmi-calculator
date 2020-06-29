import 'package:bmi_calculator/config/constants.dart';
import 'package:flutter/material.dart';



class Panel extends StatelessWidget {
  final Color color;
  final Widget child;
  final Function onTap;

  Panel({this.color, this.child, this.onTap});

  factory Panel.create() {
    return Panel(color: kACTIVE_CARD_COLOR);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: color ?? kACTIVE_CARD_COLOR),
        child: child,
      ),
    );
  }
}
