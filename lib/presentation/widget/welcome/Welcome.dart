import 'package:coupleutils/presentation/screen/CalendarScreen.dart';
import 'package:coupleutils/presentation/screen/ShopListScreen.dart';
import 'package:coupleutils/presentation/screen/TodoScreen.dart';
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
            CustomFlatButton(
                textButton: Strings.shopListTitle, route: ShopListScreen()),
            CustomFlatButton(
                textButton: Strings.calendarTitle, route: CalendarScreen()),
            CustomFlatButton(textButton: Strings.todoTitle, route: TodoScreen())
          ],
        ),
      ),
    ));
  }
}

class CustomFlatButton extends StatelessWidget {
  final String textButton;
  final StatelessWidget route;

  CustomFlatButton({Key key, @required this.textButton, @required this.route})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => this.route));
        },
        color: Colors.blue,
        textColor: Colors.white,
        disabledColor: Colors.grey,
        disabledTextColor: Colors.black,
        padding: EdgeInsets.all(Dimens.dimens_8),
        splashColor: Colors.blueAccent,
        child: Text(this.textButton));
  }
}
