import 'package:coupleutils/presentation/screen/CalendarScreen.dart';
import 'package:coupleutils/presentation/screen/ShopListScreen.dart';
import 'package:coupleutils/presentation/screen/TodoScreen.dart';
import 'package:coupleutils/utils/Dimens.dart';
import 'package:coupleutils/utils/Strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(padding: EdgeInsets.zero, children: <Widget>[
      _createHeader(),
      _createDrawerItem(
          icon: Icons.list,
          text: Strings.shopListTitle,
          onTap: () => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => ShopListScreen()))),
      _createDrawerItem(
          icon: Icons.calendar_today,
          text: Strings.calendarTitle,
          onTap: () => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => CalendarScreen()))),
      _createDrawerItem(
          icon: Icons.check_box,
          text: Strings.todoTitle,
          onTap: () => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => TodoScreen())))
    ]));
  }

  Widget _createHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        child: null,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage('images/lake.jpg'))));
  }

  Widget _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: Dimens.dimens_8),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
