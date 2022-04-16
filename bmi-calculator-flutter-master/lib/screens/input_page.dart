import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../components/reuseable_card.dart';
import '../constants.dart';
import 'result.dart';
import '../components/botton_button.dart';
import '../components/round_icon_button.dart';
import '../calculate_brain.dart';

enum gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColour = kinActiveCardColour;
  Color femaleCardColour = kinActiveCardColour;
  gender selectedGender;
  int heightSlider = 180;
  int weight = 60;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReuseableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = gender.male;
                        });
                      },
                      colour: selectedGender == gender.male
                          ? kactiveCardColour
                          : kinActiveCardColour,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReuseableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = gender.female;
                        });
                      },
                      colour: selectedGender == gender.female
                          ? kactiveCardColour
                          : kinActiveCardColour,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ReuseableCard(
                colour: kactiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Height'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          heightSlider.toString(),
                          style: kfontStyle,
                        ),
                        Text(
                          'CM',
                          style: kfontStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          inactiveTrackColor: Colors.black,
                          thumbColor: Colors.white,
                          overlayColor: Colors.red,
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30.0)),
                      child: Slider(
                        value: heightSlider.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue) {
                          setState(() {
                            heightSlider = newValue.round();
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: ReuseableCard(
                    colour: kactiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Weight'),
                        Text(
                          weight.toString(),
                          style: kfontStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              child: Icons.remove,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              child: Icons.add,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    colour: kactiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Age'),
                        Text(
                          age.toString(),
                          style: kfontStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              child: Icons.remove,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              child: Icons.add,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )),
            BottomButton(
                onTap: () {
                  //initialize
                  CalculatorBrain calc =
                      CalculatorBrain(height: heightSlider, weight: weight);
                  print(heightSlider);
                  print(weight);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Result(
                        bmiResult: calc.calculateBMI(),
                        resultText: calc.getResult(),
                        interpretation: calc.getInterpretation(),
                      ),
                    ),
                  );
                },
                nameButton: 'Calculate')
          ],
        ));
  }
}
