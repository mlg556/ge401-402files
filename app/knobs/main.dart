import 'package:flutter/material.dart';
import 'package:flutter_knob/flutter_knob.dart';


void main() {
  runApp(BluDistApp());
}

class BluDistApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AppHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.blue
      )
    );
  }
}

class AppHomePage extends StatefulWidget {
  @override
  _AppHomePageState createState() => _AppHomePageState();
}

class _AppHomePageState extends State<AppHomePage> {

  double _valGain = 0.0;
  double _valTone = 0.0;
  double _valVolume = 0.0;

  void _setValueGain(double value) {
    setState(() {
      _valGain = value;
    });
  }

  void setValueTone(double value) {
    setState(() {
      _valTone = value;
    });
  }

  void _setValueVolume(double value) {
    setState(() {
      _valVolume = value;
    });
  }

  static const double minValue = 0;
  static const double maxValue = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BluDist'),
          centerTitle: true
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text('GAIN',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontFamily: 'Hack')),
                  Knob(
                      value: _valGain,
                      color: Colors.blue,
                      onChanged: _setValueGain,
                      min: minValue,
                      max: maxValue,
                      size: 75),
                  Text(
                    '${_valGain.toStringAsFixed(0)}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontFamily: 'Hack'),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Column(
                children: [
                  Text('TONE',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontFamily: 'Hack'),
                      textAlign: TextAlign.center),
                  Knob(
                      value: _valTone,
                      color: Colors.blue,
                      onChanged: setValueTone,
                      min: minValue,
                      max: maxValue,
                      size: 75),
                  Text(
                    '${_valTone.toStringAsFixed(0)}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontFamily: 'Hack'),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    'VOL',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontFamily: 'Hack'),
                    textAlign: TextAlign.center,
                  ),
                  Knob(
                      value: _valVolume,
                      color: Colors.blue,
                      onChanged: _setValueVolume,
                      min: minValue,
                      max: maxValue,
                      size: 75),
                  Text(
                    '${_valVolume.toStringAsFixed(0)}',
                    style: TextStyle(
                        fontFamily: 'Hack', fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
