import 'package:coupleutils/presentation/screen/CalendarScreen.dart';
import 'package:coupleutils/presentation/screen/ShopListScreen.dart';
import 'package:coupleutils/utils/Dimens.dart';
import 'package:coupleutils/utils/Strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Welcome stateful widget
class Welcome extends StatefulWidget {
  Welcome({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              Strings.appTitle,
              style: TextStyle(fontSize: Dimens.dimens_60),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: Dimens.dimens_150),
            FlatButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ShopListScreen()));
                },
                color: Colors.blue,
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                padding: EdgeInsets.all(Dimens.dimens_8),
                splashColor: Colors.blueAccent,
                child: Text(Strings.shopListTitle)),
            FlatButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CalendarScreen()));
                },
                color: Colors.blue,
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                padding: EdgeInsets.all(Dimens.dimens_8),
                splashColor: Colors.blueAccent,
                child: Text(Strings.calendarTitle))
          ],
        ),
      ),
    ));
  }
}
