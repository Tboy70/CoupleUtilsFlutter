class TodoListItemEntity {
  final String idItem;
  final String nameItem;
  final String doneItem;

  TodoListItemEntity(
      {this.idItem,
      this.nameItem,
      this.doneItem});

  factory TodoListItemEntity.fromJson(Map<String, dynamic> json) {
    return TodoListItemEntity(
        idItem: json['idItem'],
        nameItem: json['nameItem'],
        doneItem: json['doneItem']);
  }
}
