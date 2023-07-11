import 'package:bmi_flutter/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'box_widget.dart';
import 'calculator_brain.dart';

Color inactiveCardColor = Color(0xFF1D1E33);
Color activeCardColor = Color(0xFF212121);

enum Gender { male, female, notr }

class BmiPage extends StatefulWidget {
  const BmiPage({super.key});

  @override
  State<BmiPage> createState() => _BmiPageState();
}

class _BmiPageState extends State<BmiPage> {
  Gender selectedGender = Gender.notr;
  int height = 120;
  int weight = 50;
  int age = 18;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  child: BoxWidget(
                    colour: selectedGender == Gender.male
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  child: BoxWidget(
                      colour: selectedGender == Gender.female
                          ? activeCardColor
                          : inactiveCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      )),
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: BoxWidget(
            colour: inactiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('HEIGHT'),
                SizedBox(
                  height: 13.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      style: TextStyle(
                          fontSize: 40.0, fontWeight: FontWeight.w900),
                    ),
                    Text('cm')
                  ],
                ),
                SliderTheme(
                  data: SliderThemeData(
                      activeTrackColor: Colors.white,
                      overlayColor: Color(0x1FEB1555),
                      thumbColor: Colors.redAccent,
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0)),
                  child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      inactiveColor: Colors.black,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      }),
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: BoxWidget(
                  colour: inactiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('WEIGHT'),
                      Text(
                        weight.toString(),
                        style: TextStyle(
                            fontSize: 40.0, fontWeight: FontWeight.w900),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RawMaterialButton(
                            elevation: 6.0,
                            shape: CircleBorder(),
                            constraints: BoxConstraints.tightFor(
                                width: 56.0, height: 56.0),
                            child: Icon(FontAwesomeIcons.minus, size: 20.0),
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                            fillColor: Colors.black,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          RawMaterialButton(
                            elevation: 6.0,
                            shape: CircleBorder(),
                            constraints: BoxConstraints.tightFor(
                                width: 56.0, height: 56.0),
                            child: Icon(
                              FontAwesomeIcons.plus,
                              size: 20.0,
                            ),
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                            fillColor: Colors.black,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: BoxWidget(
                  colour: inactiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('AGE'),
                      Text(
                        age.toString(),
                        style: TextStyle(
                            fontSize: 40.0, fontWeight: FontWeight.w900),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RawMaterialButton(
                            elevation: 6.0,
                            shape: CircleBorder(),
                            constraints: BoxConstraints.tightFor(
                                width: 56.0, height: 56.0),
                            child: Icon(FontAwesomeIcons.minus, size: 20.0),
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            },
                            fillColor: Colors.black,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          RawMaterialButton(
                            elevation: 6.0,
                            shape: CircleBorder(),
                            constraints: BoxConstraints.tightFor(
                                width: 56.0, height: 56.0),
                            child: Icon(
                              FontAwesomeIcons.plus,
                              size: 20.0,
                            ),
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                            fillColor: Colors.black,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            CalculatorBrain calc =
                new CalculatorBrain(height: height, weight: weight);

            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ResultsPage(
                          bmiResult: calc.calculateBMI(),
                          resultText: calc.getResult(),
                          interpretation: calc.getInterpretation(),
                        )));
          },
          child: Container(
            color: Colors.redAccent,
            margin: const EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: 80.0,
            child: Center(
              child: const Text(
                'CALCULATE',
              ),
            ),
          ),
        )
      ],
    );
  }
}
