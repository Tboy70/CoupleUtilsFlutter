import 'package:coupleutils/domain/model/ClassicResponse.dart';
import 'package:coupleutils/domain/model/Event.dart';

abstract class CalendarRepository {

  Future<List<Event>> getEventItemList();

  Future<bool> deleteEventItem(String idEvent);

  Future<ClassicResponse> sendEventItem(Event eventItem);
}
