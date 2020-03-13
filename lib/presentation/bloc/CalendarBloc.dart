import 'package:coupleutils/data/repository/CalendarRepositoryimpl.dart';
import 'package:coupleutils/domain/model/ClassicResponse.dart';
import 'package:coupleutils/domain/model/Event.dart';
import 'package:coupleutils/domain/repository/CalendarRepository.dart';
import 'package:coupleutils/utils/Values.dart';

class CalendarBloc {
  final CalendarRepository calendarRepository = CalendarRepositoryImpl();

  Future<List<Event>> fetchEventList() => calendarRepository.getEventItemList();

  Future<bool> deleteEvent(String idEvent) =>
      calendarRepository.deleteEventItem(idEvent);

  Future<ClassicResponse> sendEvent(String eventName, int typeEvent,
      String beginDateEvent, String participantEvent) {
    return calendarRepository.sendEventItem(Event(
        nameEvent: eventName,
        typeEvent: typeEvent.toString(),
        beginEvent: beginDateEvent,
        participantEvent: _formatParticipant(participantEvent)));
  }

  _formatParticipant(String participantEvent) {
    if (participantEvent == Values.users_list[0])
      return 0;
    else if (participantEvent == Values.users_list[1])
      return 1;
    else if (participantEvent == Values.users_list[2]) return 2;
  }
}
