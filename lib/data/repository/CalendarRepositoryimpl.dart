import 'package:coupleutils/data/api/API.dart';
import 'package:coupleutils/data/mapper/EventItemDataMapper.dart';
import 'package:coupleutils/domain/model/ClassicResponse.dart';
import 'package:coupleutils/domain/model/Event.dart';
import 'package:coupleutils/domain/repository/CalendarRepository.dart';

class CalendarRepositoryImpl extends CalendarRepository {
  final api = API();

  EventItemDataMapper eventItemDataMapper = EventItemDataMapper();

  @override
  Future<List<Event>> getEventItemList() {
    return api.fetchEventList().then((onValue) {
      return eventItemDataMapper.transformEntityListToModelList(onValue);
    });
  }

  @override
  Future<bool> deleteEventItem(String idEvent) => api.deleteEvent(idEvent);

  @override
  Future<ClassicResponse> sendEventItem(Event eventItem) {
    return api.sendEvent(eventItemDataMapper.transformModelToEntity(eventItem));
  }
}
