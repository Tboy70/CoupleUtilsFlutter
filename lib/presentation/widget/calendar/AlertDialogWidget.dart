import 'package:coupleutils/utils/Dimens.dart';
import 'package:coupleutils/utils/Strings.dart';
import 'package:coupleutils/utils/Values.dart';
import 'package:flutter/material.dart';

import 'DateSelectionWidget.dart';
import 'RadioButton.dart';

class AlertDialogWidget extends StatefulWidget {
  AlertDialogWidget({Key key}) : super(key: key);

  @override
  _AlertDialogWidgetState createState() => _AlertDialogWidgetState();
}

class _AlertDialogWidgetState extends State<AlertDialogWidget> {
  // Radio button stuff
  var retrievedRadioButtonValue = 1;

  // Event title stuff
  var titleEventController = TextEditingController();

  // Users stuff
  List _users = Values.users_list;
  List<DropdownMenuItem<String>> _dropDownMenuItems;

  // User inputs
  String _currentUser;
  String _currentEventName;
  String _currentPlannedDate;

  @override
  void initState() {
    _dropDownMenuItems = _getDropDownMenuItems();
    _currentUser = null;
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
                  value: _currentUser,
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
                      Navigator.of(context).pop();
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
      _currentUser = selectedUser;
    });
  }

  bool _checkInfoForm(int retrieveRadioButtonValue) =>
      _currentUser != null &&
      _currentEventName.isNotEmpty &&
      _currentPlannedDate != null &&
      _currentPlannedDate.isNotEmpty;
}
