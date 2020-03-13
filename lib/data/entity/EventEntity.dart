class EventEntity {
  final String idEvent;
  final String nameEvent;
  final String typeEvent;
  final String beginEvent;
  final String endEvent;
  final int participantEvent;

  EventEntity({
    this.idEvent,
    this.nameEvent,
    this.typeEvent,
    this.beginEvent,
    this.endEvent,
    this.participantEvent,
  });

  factory EventEntity.fromJson(Map<String, dynamic> json) {
    return EventEntity(
        idEvent: json['idEvent'],
        nameEvent: json['nameEvent'],
        typeEvent: json['typeEvent'],
        beginEvent: json['beginEvent'],
        endEvent: json['endEvent'],
        participantEvent: json['participantEvent']);
  }

  Map<String, dynamic> toJson() {
    return {
      "idEvent": this.idEvent,
      "nameEvent": this.nameEvent,
      "typeEvent": this.typeEvent,
      "beginEvent": this.beginEvent,
      "endEvent": this.endEvent,
      "participantEvent": this.participantEvent
    };
  }
}
