class TodoListItem {
  final String idItem;
  final String nameItem;
  final String boughtItem;
//  final String doneItem;

  TodoListItem({this.idItem, this.nameItem, this.boughtItem});

  factory TodoListItem.fromJson(Map<String, dynamic> json) {
    return TodoListItem(
        idItem: json['idItem'],
        nameItem: json['nameItem'],
        boughtItem: json['boughtItem']);
  }

//  factory TodoListItem.fromJson(Map<String, dynamic> json) {
//    return TodoListItem(
//        idItem: json['idItem'],
//        nameItem: json['nameItem'],
//        boughtItem: json['doneItem']);
//  }
}
