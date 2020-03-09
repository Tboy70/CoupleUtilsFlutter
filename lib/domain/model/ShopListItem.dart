
class ShopListItem {
  final String idItem;
  final String nameItem;
  final String boughtItem;

  ShopListItem({this.idItem, this.nameItem, this.boughtItem});

  factory ShopListItem.fromJson(Map<String, dynamic> json) {
    return ShopListItem(
        idItem: json['idItem'],
        nameItem: json['nameItem'],
        boughtItem: json['boughtItem']);
  }
}