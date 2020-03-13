import 'dart:convert';

import 'package:coupleutils/data/entity/EventEntity.dart';
import 'package:coupleutils/domain/model/Event.dart';
import 'package:intl/intl.dart';

List<EventEntity> parseEventList(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<EventEntity>((json) => EventEntity.fromJson(json)).toList();
}

bool parseDeleteEventResponse(String responseBody) {
  return true;
}

class EventItemDataMapper {
  List<Event> transformEntityListToModelList(
      List<EventEntity> eventEntityList) {
    List<Event> eventList = List();
    eventEntityList.forEach((element) {
      eventList.add(transformEntityToModel(element));
    });

    return eventList;
  }

  Event transformEntityToModel(EventEntity eventEntity) {

    const String WANTED_FORMAT = "dd/MM/yyyy";

    return Event(
        idEvent: eventEntity.idEvent,
        nameEvent: eventEntity.nameEvent,
        typeEvent: eventEntity.typeEvent,
        beginEvent: DateFormat(WANTED_FORMAT).format(DateTime.parse(eventEntity.beginEvent)),
        endEvent: eventEntity.endEvent,
        participantEvent: eventEntity.participantEvent);
  }

  EventEntity transformModelToEntity(Event eventItem) {
    return EventEntity(
        idEvent: eventItem.idEvent,
        nameEvent: eventItem.nameEvent,
        typeEvent: eventItem.typeEvent,
        beginEvent: eventItem.beginEvent,
        endEvent: eventItem.endEvent,
        participantEvent: eventItem.participantEvent);
  }
}
