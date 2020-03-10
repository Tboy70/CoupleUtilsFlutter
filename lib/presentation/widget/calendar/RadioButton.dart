import 'package:coupleutils/utils/Dimens.dart';
import 'package:coupleutils/utils/Strings.dart';
import 'package:coupleutils/utils/Values.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RadioButton extends StatefulWidget {
  final Function(int) callback;

  RadioButton({Key key, this.callback}) : super(key: key);

  @override
  RadioButtonState createState() => RadioButtonState();
}

class RadioButtonState extends State<RadioButton> {
  var group = Values.calendar_radio_button_group;

  @override
  Widget build(BuildContext context) {
    return Row(
        children: <Widget>[
          Row(
            children: <Widget>[
              Radio(
                  value: 1,
                  groupValue: group,
                  onChanged: (T) {
                    setState(() {
                      group = T;
                      widget.callback(T);
                    });
                  }),
              Text(
                Strings.punctualEvent,
                style: TextStyle(fontSize: Dimens.dimens_13),
              )
            ],
          ),
          Expanded(
              child: Row(
                children: <Widget>[
                  Radio(
                      value: 2,
                      groupValue: group,
                      onChanged: (T) {
                        setState(() {
                          group = T;
                          widget.callback(T);
                        });
                      }),
                  Text(
                    Strings.timeSlotEvent,
                    style: TextStyle(
                      fontSize: Dimens.dimens_13,
                    ),
                  )
                ],
              ))
        ]);
  }
}
