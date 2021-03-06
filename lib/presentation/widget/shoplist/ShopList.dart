import 'package:coupleutils/domain/model/ShopListItem.dart';
import 'package:coupleutils/presentation/bloc/ShopListBloc.dart';
import 'package:coupleutils/presentation/widget/AppDrawer.dart';
import 'package:coupleutils/utils/Dimens.dart';
import 'package:coupleutils/utils/Strings.dart';
import 'package:coupleutils/utils/Values.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'ShopListCheckbox.dart';

/// ShopList stateful widget
class ShopList extends StatefulWidget {
  ShopList({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ShopListState createState() => _ShopListState();
}

class _ShopListState extends State<ShopList> {
  var shopListBloc = ShopListBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        drawer: AppDrawer(),
        body: FutureBuilder<List<ShopListItem>>(
            future: shopListBloc.fetchShopItemsList(),
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);

              return snapshot.hasData
                  ? RefreshIndicator(
                      onRefresh: _refreshShopItemList,
                      child: snapshot.data.isEmpty
                          ? PageView(
                              scrollDirection: Axis.vertical,
                              physics: const AlwaysScrollableScrollPhysics(),
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(Icons.find_in_page,
                                        size: Dimens.dimens_150,
                                        color: Colors.grey[500]),
                                    Text(Strings.noDataFound)
                                  ],
                                )
                              ],
                            )
                          : ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                final item = snapshot.data[index];
                                return Dismissible(
                                  key: Key(item.idItem),
                                  onDismissed: (direction) {
                                    shopListBloc
                                        .deleteShopItem(item.idItem)
                                        .then((onValue) {
                                      setState(() {
                                        snapshot.data.removeAt(index);
                                        Scaffold.of(context).showSnackBar(SnackBar(
                                            content: Text(Strings.itemDeleted
                                                .replaceFirst(
                                                    Strings.itemNamePlaceholder,
                                                    item.nameItem)),
                                            duration: Duration(
                                                milliseconds: Values
                                                    .snackbar_duration_500)));
                                      });
                                    });
                                  },
                                  background: Container(
                                      color: Colors.red,
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.white,
                                      ),
                                      alignment: Alignment.centerRight,
                                      padding: EdgeInsetsDirectional.only(
                                          end: Dimens.dimens_25)),
                                  child: ShopListCheckbox(snapshot.data[index]),
                                );
                              }))
                  : Center(child: CircularProgressIndicator());
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            return _buildDialog();
          },
          child: Icon(Icons.add),
        ));
  }

  Future<void> _refreshShopItemList() async {
    setState(() {});
    return null;
  }

  Future<dynamic> _buildDialog() {
    TextEditingController _textFieldController = TextEditingController();

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text(Strings.addArticle),
              content: TextField(
                controller: _textFieldController,
                decoration: InputDecoration(hintText: Strings.article),
              ),
              actions: <Widget>[
                FlatButton(
                    child: Text(Strings.cancel),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
                FlatButton(
                    child: Text(Strings.validate),
                    onPressed: () {
                      shopListBloc
                          .sendShopItem(_textFieldController.text)
                          .then((value) {
                        Navigator.of(context).pop();
                        setState(() {
                          _refreshShopItemList();
                        });
                      }).catchError(print);
                    }),
              ]);
        });
  }
}
