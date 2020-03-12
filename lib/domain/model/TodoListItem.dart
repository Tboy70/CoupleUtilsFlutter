class TodoListItem {
  final String idItem;
  final String nameItem;
  final String doneItem;

  TodoListItem({this.idItem, this.nameItem, this.doneItem});

  factory TodoListItem.fromJson(Map<String, dynamic> json) {
    return TodoListItem(
        idItem: json['idItem'],
        nameItem: json['nameItem'],
        doneItem: json['doneItem']);
  }
}
