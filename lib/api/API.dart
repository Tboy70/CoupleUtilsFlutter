import 'package:coupleutils/mapper/ShopListItemMapper.dart';
import 'package:coupleutils/model/ShopListItem.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class API {
  Future<List<ShopListItem>> fetchShopItemsList() async {
    final response = await http.Client()
        .get('http://thomasboy.fr/couple_utils_api/public/shopItemList');
    return compute(parseShopListItem, response.body);
  }
}
