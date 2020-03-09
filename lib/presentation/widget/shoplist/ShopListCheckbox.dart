import 'package:coupleutils/domain/model/ShopListItem.dart';
import 'package:coupleutils/presentation/bloc/ShopListBloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Checkbox widget
class ShopListCheckbox extends StatefulWidget {
  ShopListCheckbox(this.shopItem) : super();

  final ShopListItem shopItem;

  @override
  _CheckboxState createState() => _CheckboxState();
}

class _CheckboxState extends State<ShopListCheckbox> {
  var checkedBox = false;
  var lineThrough = false;
  var shopListBloc = ShopListBloc();

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
        title: Text(
          widget.shopItem.nameItem,
          style: TextStyle(
              decoration: lineThrough ? TextDecoration.lineThrough : null),
        ),
        value: checkedBox,
        onChanged: (bool value) {
          shopListBloc.updateShopItem(widget.shopItem.idItem).then((onValue) {
            setState(() {
              checkedBox = value;
              lineThrough = value;
            });
          });
        });
  }
}
