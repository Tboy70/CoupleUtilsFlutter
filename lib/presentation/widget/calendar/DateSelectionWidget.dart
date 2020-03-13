import 'package:coupleutils/utils/Dimens.dart';
import 'package:coupleutils/utils/Strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:intl/intl.dart';

class DateSelectionWidget extends StatefulWidget {
  final int retrieveRadioButtonValue;
  final Function(String) callback;

  DateSelectionWidget(this.retrieveRadioButtonValue, this.callback, {Key key})
      : super(key: key);

  @override
  _DateSelectionWidgetState createState() => _DateSelectionWidgetState();
}

class _DateSelectionWidgetState extends State<DateSelectionWidget> {
  static const FRENCH_FORMAT = 'dd/MM/yyyy';
  static const DEFAULT_FORMAT = 'yyyy-MM-dd';

  var dateSelectionController = TextEditingController();
  var dateSelectionControllerEnd = TextEditingController();
  var dateSelectionControllerBegin = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (widget.retrieveRadioButtonValue == 1) {
      return TextField(
        controller: dateSelectionController,
        readOnly: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: Strings.plannedDate,
        ),
        onTap: () {
          _buildDatePicker((dateTime) {
            setState(() {
              dateSelectionController.text =
                  DateFormat(FRENCH_FORMAT).format(dateTime);
              widget.callback(DateFormat(DEFAULT_FORMAT).format(dateTime));
            });
          });
        },
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: TextField(
                controller: dateSelectionControllerBegin,
                readOnly: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: Strings.beginDate,
                ),
                onTap: () {
                  _buildDatePicker((dateTime) {
                    setState(() {
                      dateSelectionControllerBegin.text =
                          DateFormat(FRENCH_FORMAT).format(dateTime);
                      widget.callback(DateFormat(DEFAULT_FORMAT).format(dateTime));
                    });
                  });
                }),
          ),
          Expanded(
              child: TextField(
                  controller: dateSelectionControllerEnd,
                  readOnly: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: Strings.endDate,
                  ),
                  onTap: () {
                    _buildDatePicker((dateTime) {
                      setState(() {
                        dateSelectionControllerEnd.text =
                            DateFormat(FRENCH_FORMAT).format(dateTime);
                        widget.callback(DateFormat(DEFAULT_FORMAT).format(dateTime));
                      });
                    });
                  }))
        ],
      );
    }
  }

  Future<void> _buildDatePicker(Function(DateTime) callback) async {
    await showRoundedDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(DateTime.now().year - 1),
        lastDate: DateTime(DateTime.now().year + 1),
        borderRadius: Dimens.dimens_16,
        onTapDay: (DateTime dateTime, bool available) {
          callback(dateTime);
          return available;
        });
  }
}
