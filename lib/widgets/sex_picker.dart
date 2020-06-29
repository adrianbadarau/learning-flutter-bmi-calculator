import 'package:bmi_calculator/config/constants.dart';
import 'package:flutter/material.dart';

class SexPicker extends StatelessWidget {
  final String text;
  final IconData icon;

  const SexPicker(
      {Key key, @required this.text, @required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon, size: 80),
        SizedBox(height: 15),
        Text(text, style: kICON_TEXT_STYLE)
      ],
    );
  }
}
