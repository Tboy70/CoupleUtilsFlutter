import 'package:coupleutils/presentation/bloc/CalendarBloc.dart';
import 'package:coupleutils/utils/Dimens.dart';
import 'package:coupleutils/utils/Strings.dart';
import 'package:coupleutils/utils/Values.dart';
import 'package:flutter/material.dart';

import 'DateSelectionWidget.dart';
import 'RadioButton.dart';

class AlertDialogWidget extends StatefulWidget {

  final Function(bool) callback;

  AlertDialogWidget({Key key, this.callback}) : super(key: key);

  @override
  _AlertDialogWidgetState createState() => _AlertDialogWidgetState();
}

class _AlertDialogWidgetState extends State<AlertDialogWidget> {
  CalendarBloc calendarBloc = CalendarBloc();

  // Radio button stuff
  var retrievedRadioButtonValue = 1;

  // Event title stuff
  var titleEventController = TextEditingController();

  // Users stuff
  List _users = Values.users_list;
  List<DropdownMenuItem<String>> _dropDownMenuItems;

  // User inputs
  String _currentEventName;
  String _currentParticipant;
  String _currentPlannedDate;

  @override
  void initState() {
    _dropDownMenuItems = _getDropDownMenuItems();
    _currentParticipant = null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text(Strings.addEvent),
        content: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(children: <Widget>[
              RadioButton(callback: (radioButtonValue) {
                setState(() {
                  retrievedRadioButtonValue = radioButtonValue;
                });
              }),
              SizedBox(height: Dimens.dimens_20),
              DateSelectionWidget(retrievedRadioButtonValue, (date) {
                setState(() {
                  _currentPlannedDate = date;
                });
              }),
              SizedBox(height: Dimens.dimens_20),
              TextField(
                  controller: titleEventController,
                  onChanged: (text) {
                    setState(() {
                      _currentEventName = titleEventController.text;
                    });
                  },
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: Strings.eventName)),
              SizedBox(height: Dimens.dimens_20),
              DropdownButton(
                  value: _currentParticipant,
                  hint: Text(Strings.participants),
                  items: _dropDownMenuItems,
                  onChanged: changedDropDownItem)
            ])),
        actions: <Widget>[
          FlatButton(
              child: Text(Strings.cancel),
              onPressed: () {
                Navigator.of(context).pop();
              }),
          FlatButton(
              child: Text(Strings.validate),
              disabledTextColor: Colors.grey,
              onPressed: _checkInfoForm(retrievedRadioButtonValue) == true
                  ? () {
                      calendarBloc
                          .sendEvent(
                              _currentEventName,
                              retrievedRadioButtonValue,
                              _currentPlannedDate,
                              _currentParticipant)
                          .then((value) {
                        Navigator.of(context).pop();
                        widget.callback(true);
                      }).catchError(print);
                    }
                  : null)
        ]);
  }

  List<DropdownMenuItem<String>> _getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = List();
    _users.forEach((user) {
      items.add(DropdownMenuItem(value: user, child: Text(user)));
    });

    return items;
  }

  void changedDropDownItem(String selectedUser) {
    setState(() {
      _currentParticipant = selectedUser;
    });
  }

  bool _checkInfoForm(int retrieveRadioButtonValue) =>
      _currentParticipant != null &&
      _currentEventName.isNotEmpty &&
      _currentPlannedDate != null &&
      _currentPlannedDate.isNotEmpty;
}
