import 'package:coupleutils/presentation/widget/calendar/AlertDialogWidget.dart';
import 'package:coupleutils/utils/Dimens.dart';
import 'package:coupleutils/utils/Strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../AppDrawer.dart';

class Calendar extends StatefulWidget {
  Calendar({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(title: Text(widget.title)),
        drawer: AppDrawer(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            return _buildDialog();
          },
          child: Icon(Icons.add),
        ),
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  Strings.calendarTitle,
                  style: TextStyle(fontSize: Dimens.dimens_60),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ));
  }

  Future<dynamic> _buildDialog() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialogWidget();
        });
  }
}
