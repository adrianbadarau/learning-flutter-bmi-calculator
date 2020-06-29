import 'package:bmi_calculator/config/constants.dart';
import 'package:flutter/material.dart';

class NavigateButton extends StatelessWidget {
  const NavigateButton(
      {Key key,
      @required this.buttonText,
      @required this.navigationLocation,
      this.data})
      : super(key: key);

  final String buttonText;
  final String navigationLocation;
  final Map data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, navigationLocation, arguments: data ?? {});
      },
      child: Container(
        color: kBOTTOM_CONTAINER_COLOR,
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: kBOTTOM_CONTAINER_HEIGHT,
        child: Center(child: Text(buttonText, style: TextStyle(fontSize: 24))),
      ),
    );
  }
}
