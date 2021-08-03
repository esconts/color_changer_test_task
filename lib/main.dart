import 'dart:math'; // Native Dart library with random number generator
import 'package:flutter/material.dart';

void main() => runApp(TestTaskApp());

class TestTaskApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ColorChangerPage(),
    );
  }
}

class ColorChangerPage extends StatefulWidget {
  @override
  _ColorChangerPageState createState() => _ColorChangerPageState();
}

class _ColorChangerPageState extends State<ColorChangerPage> {
  static const double kOpacity = 1.0;
  static const kTitleTextStyle =
      TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24);
  static final kGreyColorStyle = Colors.grey[500];

  int red = 255;
  int green = 255;
  int blue = 255;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(() {
            _randomizeColor();
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          color: Color.fromRGBO(red, green, blue, kOpacity),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Hey there',
                  style: kTitleTextStyle,
                ),
                SizedBox(height: 40),
                Container(
                  color: Colors.black,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      _sliderBuilder(
                          leadingText: 'R',
                          value: red,
                          onChanged: (var changingValue) {
                            setState(() {
                              red = changingValue.round();
                            });
                          }),
                      _sliderBuilder(
                          leadingText: 'G',
                          value: green,
                          onChanged: (var changingValue) {
                            setState(() {
                              green = changingValue.round();
                            });
                          }),
                      _sliderBuilder(
                          leadingText: 'B',
                          value: blue,
                          onChanged: (var changingValue) {
                            setState(() {
                              blue = changingValue.round();
                            });
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

//The function that generates random RGB colors
  _randomizeColor() {
    Random random = new Random();
    red = random.nextInt(255);
    green = random.nextInt(255);
    blue = random.nextInt(255);
  }

//The function that builds ListTile with Slider inside which can regulate color
  _sliderBuilder(
      {String? leadingText,
      int? value,
      final ValueChanged<double>? onChanged}) //The arguments we will receive
  {
    return ListTile(
      leading: Text(
        leadingText!,
        style: TextStyle(
            fontSize: 24, fontWeight: FontWeight.bold, color: kGreyColorStyle),
      ),
      title: Slider(
        activeColor: Colors.white,
        inactiveColor: kGreyColorStyle,
        min: 0,
        max: 255,
        value: value!.toDouble(),
        onChanged: onChanged,
      ),
    );
  }
}
