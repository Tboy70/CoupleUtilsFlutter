class ShopListItemEntity {
  final String idItem;
  final String nameItem;
  final String boughtItem;

  ShopListItemEntity({this.idItem, this.nameItem, this.boughtItem});

  factory ShopListItemEntity.fromJson(Map<String, dynamic> json) {
    return ShopListItemEntity(
        idItem: json['idItem'],
        nameItem: json['nameItem'],
        boughtItem: json['boughtItem']);
  }
}
