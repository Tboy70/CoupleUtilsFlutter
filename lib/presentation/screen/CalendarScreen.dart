import 'package:coupleutils/presentation/widget/calendar/Calendar.dart';
import 'package:coupleutils/utils/Strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalendarScreen extends StatelessWidget {
  static const String routeName = '/calendar';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appTitle,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: Calendar(title: Strings.calendarTitle),
    );
  }
}
