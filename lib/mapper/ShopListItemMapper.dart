import 'dart:convert';

import 'package:coupleutils/model/ShopListItem.dart';

List<ShopListItem> parseShopListItem(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed
      .map<ShopListItem>((json) => ShopListItem.fromJson(json))
      .toList();
}

class ShopListItemMapper {}
