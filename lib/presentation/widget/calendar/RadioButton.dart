import 'package:coupleutils/utils/Strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RadioButton extends StatefulWidget {
  RadioButton({Key key}) : super(key: key);

  @override
  _RadioButtonState createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  var group = 1;

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Radio(
          value: 1,
          groupValue: group,
          onChanged: (T) {
            print(T);
            setState(() {
              group = T;
            });
          }),
      new Text(
        Strings.punctualEvent,
        style: new TextStyle(fontSize: 12.0),
      ),
      Radio(
          value: 2,
          groupValue: group,
          onChanged: (T) {
            print(T);
            setState(() {
              group = T;
            });
          }),
      new Text(
        Strings.timeSlotEvent,
        style: new TextStyle(
          fontSize: 12.0,
        ),
      ),
    ]);
  }
}
