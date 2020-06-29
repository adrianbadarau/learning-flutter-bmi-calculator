import 'package:bmi_calculator/config/constants.dart';
import 'package:bmi_calculator/services/bmi_calculator_service.dart';
import 'package:bmi_calculator/widgets/navigate_button.dart';
import 'package:bmi_calculator/widgets/panel.dart';
import 'package:flutter/material.dart';

class Results extends StatefulWidget {
  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {


  @override
  Widget build(BuildContext context) {
    final Map<dynamic, dynamic> routeData = ModalRoute.of(context).settings.arguments;
    var service = BmiCalculatorService(height: routeData['height'], weight: routeData['weight']);
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              child: Text('Your result',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
            ),
          ),
          Expanded(
            flex: 5,
            child: Panel(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(service.getResult(),style: kResultTextStyle,),
                  Text(service.calculateBMI(),style: kNumberTextStyle),
                  Text(service.getInterpretation(),style: TextStyle(fontSize: 20),textAlign: TextAlign.center,)
                ],
              ),
            ),
          ),
          NavigateButton(buttonText: 'Calculate Again', navigationLocation: '/')
        ],
      ),
    );
  }
}
