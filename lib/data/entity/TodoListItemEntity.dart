class TodoListItemEntity {
  final String idItem;
  final String nameItem;
  final String boughtItem;
//  final String doneItem; TODO : Uncomment this when API will be ready

  TodoListItemEntity(
      {this.idItem,
      this.nameItem,
      this.boughtItem}); // TODO : Replace this when API will be ready

  factory TodoListItemEntity.fromJson(Map<String, dynamic> json) {
    return TodoListItemEntity(
        idItem: json['idItem'],
        nameItem: json['nameItem'],
        boughtItem: json['boughtItem']);
  }

//  factory TodoListItemEntity.fromJson(Map<String, dynamic> json) {
//    return TodoListItemEntity(
//        idItem: json['idItem'],
//        nameItem: json['nameItem'],
//        doneItem: json['doneItem']);
//  }

}
