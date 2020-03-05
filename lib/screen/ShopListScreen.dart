import 'package:coupleutils/bloc/ShopListBloc.dart';
import 'package:coupleutils/model/ShopListItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// ECRAN SHOP LIST

class ShopListScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Couple Utils',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: ShopList(title: 'Couple Utils'),
    );
  }
}

/// ShopList stateful widget
class ShopList extends StatefulWidget {
  ShopList({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ShopListState createState() => _ShopListState();
}

class _ShopListState extends State<ShopList> {
  var shopListBloc = ShopListBloc();
  var shopListItem = new List<ShopListItem>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: FutureBuilder<List<ShopListItem>>(
            future: shopListBloc.fetchShopItemsList(),
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);

              return snapshot.hasData
                  ? RefreshIndicator(
                      onRefresh: _refreshShopItemList,
                      child: ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            return Checkbox(snapshot.data[index]);
                          }))
                  : Center(child: CircularProgressIndicator());
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print("FAB click");
          },
          child: Icon(Icons.add),
        ));
  }

  Future<void> _refreshShopItemList() async {
    setState(() {});
    return null;
  }
}

/// Checkbox widget
class Checkbox extends StatefulWidget {
  Checkbox(this.title) : super();

  final ShopListItem title;

  @override
  _CheckboxState createState() => _CheckboxState();
}

class _CheckboxState extends State<Checkbox> {
  var checkedBox = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
        title: Text(widget.title.nameItem),
        value: checkedBox,
        onChanged: (bool value) {
          setState(() {
            checkedBox = value;
          });
        });
  }
}
