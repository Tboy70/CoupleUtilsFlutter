import 'package:coupleutils/presentation/widget/shoplist/ShopList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/Strings.dart';

/// ECRAN SHOP LIST

class ShopListScreen extends StatelessWidget {
  static const String routeName = '/shopList';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appTitle,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: ShopList(title: Strings.shopListTitle),
    );
  }
}
