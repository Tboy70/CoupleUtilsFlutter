import 'dart:convert';

import 'package:coupleutils/data/entity/ShopListItemEntity.dart';
import 'package:coupleutils/domain/model/ClassicResponse.dart';
import 'package:coupleutils/domain/model/ShopListItem.dart';

List<ShopListItemEntity> parseShopListItem(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed
      .map<ShopListItemEntity>((json) => ShopListItemEntity.fromJson(json))
      .toList();
}

ClassicResponse parseSendItemResponse(String responseBody) {
  return ClassicResponse(jsonDecode(responseBody).values.toList()[0]);
}

bool parseDeleteShopItemResponse(String responseBody) {
  return true;
}

bool parseUpdateShopItemResponse(String responseBody) {
  return true;
}

class ShopListItemDataMapper {
  List<ShopListItem> transformEntityToModel(List<ShopListItemEntity> shopItemListEntity) {
    List<ShopListItem> shopListItem = List();
    shopItemListEntity.forEach((element) {
      shopListItem.add(ShopListItem(
        idItem: element.idItem,
        nameItem: element.nameItem,
        boughtItem: element.boughtItem,
      ));
    });
    return shopListItem;
  }
}
