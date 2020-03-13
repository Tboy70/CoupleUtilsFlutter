import "package:collection/collection.dart";
import 'package:coupleutils/domain/model/Event.dart';
import 'package:coupleutils/presentation/bloc/CalendarBloc.dart';
import 'package:coupleutils/presentation/widget/calendar/AlertDialogWidget.dart';
import 'package:coupleutils/utils/Dimens.dart';
import 'package:coupleutils/utils/Strings.dart';
import 'package:coupleutils/utils/Values.dart';
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
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  var calendarBloc = CalendarBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(title: Text(widget.title)),
        drawer: AppDrawer(),
        body: FutureBuilder<List<Event>>(
            future: calendarBloc.fetchEventList(),
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);

              return snapshot.hasData
                  ? RefreshIndicator(
                      onRefresh: _refreshCalendarEventList,
                      child: _generateList(snapshot.data))
                  : Center(child: CircularProgressIndicator());
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            return _buildDialog();
          },
          child: Icon(Icons.add),
        ));
  }

  _generateList(List<Event> data) {
    if (data.isEmpty) {
      return PageView(
        scrollDirection: Axis.vertical,
        physics: const AlwaysScrollableScrollPhysics(),
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.find_in_page,
                  size: Dimens.dimens_150, color: Colors.grey[500]),
              Text(Strings.noDataFound)
            ],
          )
        ],
      );
    } else {
      List<Widget> widgetList = List<Widget>();

      var newMap = groupBy(data.toList(), (obj) => obj.beginEvent);
      newMap.forEach((key, eventList) {
        widgetList.add(Text(key, style: TextStyle(fontSize: Dimens.dimens_20)));
        widgetList.add(Divider());
        eventList.forEach((value) {
          widgetList.add(Dismissible(
              key: UniqueKey(),
              onDismissed: (direction) {
                calendarBloc.deleteEvent(value.idEvent).then((onValue) {
                  setState(() {
                    eventList.remove(value);
                    _scaffoldKey.currentState.showSnackBar(SnackBar(
                        content: Text(Strings.itemDeleted.replaceFirst(
                            Strings.itemNamePlaceholder, value.nameEvent)),
                        duration: Duration(
                            milliseconds: Values.snackbar_duration_500)));
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
                  padding: EdgeInsetsDirectional.only(end: Dimens.dimens_25)),
              child: ListTile(
                  title: Text(value.nameEvent,
                      style: TextStyle(
                          fontSize: Dimens.dimens_18,
                          color: _setColorGivenParticipant(
                              value.participantEvent))))));
        });
        widgetList.add(SizedBox(height: Dimens.dimens_20));
      });

      return ListView.builder(
          itemCount: widgetList.length,
          itemBuilder: (context, index) {
            final item = widgetList[index];
            return item;
          });
    }
  }

  Future<void> _refreshCalendarEventList() async {
    setState(() {});
    return null;
  }

  Future<dynamic> _buildDialog() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialogWidget(
            callback: (success) {
              if (success) {
                _refreshCalendarEventList();
              }
            },
          );
        });
  }

  MaterialColor _setColorGivenParticipant(int participantEvent) {
    switch (participantEvent) {
      case 0:
        return Colors.blue;
        break;
      case 1:
        return Colors.red;
        break;
      case 2:
        return Colors.purple;
        break;
      default:
        return Colors.grey;
        break;
    }
  }
}