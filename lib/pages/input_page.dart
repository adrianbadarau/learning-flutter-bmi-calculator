import 'package:bmi_calculator/config/constants.dart';
import 'package:bmi_calculator/config/enums.dart';
import 'package:bmi_calculator/widgets/panel.dart';
import 'package:bmi_calculator/widgets/sex_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kINACTIVE_CARD_COLOR;
  Color femaleCardColor = kINACTIVE_CARD_COLOR;
  int height = 180;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Panel(
                      color: maleCardColor,
                      child: SexPicker(
                        icon: FontAwesomeIcons.mars,
                        text: 'MALE',
                      ),
                      onTap: () => toggleSex(Sex.MALE),
                    )),
                Expanded(
                    child: Panel(
                      color: femaleCardColor,
                      child: SexPicker(
                        icon: FontAwesomeIcons.venus,
                        text: 'FEMALE',
                      ),
                      onTap: () => toggleSex(Sex.FEMALE),
                    )),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Panel(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('HEIGHT', style: kICON_TEXT_STYLE),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(height.toString(), style: kNumberTextStyle),
                            Text('cm', style: kICON_TEXT_STYLE)
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                              thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15),
                              overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30),
                              overlayColor: Color(0x29eb1555),
                              thumbColor: Color(0xffeb1555),
                              activeTrackColor: Colors.white,
                              inactiveTrackColor: Color(0xff8d8e98)
                          ),
                          child: Slider(
                            value: height.toDouble(),
                            min: 120.0,
                            max: 220.0,
                            onChanged: (value) {
                              setState(() {
                                height = value.toInt();
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(child: Panel.create()),
                  Expanded(child: Panel.create()),
                ],
              )),
          Container(
            color: kBOTTOM_CONTAINER_COLOR,
            margin: EdgeInsets.only(top: 10),
            width: double.infinity,
            height: kBOTTOM_CONTAINER_HEIGHT,
          )
        ],
      ),
    );
  }

  void toggleSex(Sex sex) {
    setState(() {
      if (sex == Sex.MALE) {
        maleCardColor = kACTIVE_CARD_COLOR;
        femaleCardColor = kINACTIVE_CARD_COLOR;
      } else {
        femaleCardColor = kACTIVE_CARD_COLOR;
        maleCardColor = kINACTIVE_CARD_COLOR;
      }
    });
  }
}