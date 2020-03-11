import 'dart:convert';

import 'package:coupleutils/data/entity/ShopListItemEntity.dart';
import 'package:coupleutils/data/entity/TodoListItemEntity.dart';
import 'package:coupleutils/data/mapper/ShopListItemDataMapper.dart';
import 'package:coupleutils/data/mapper/TodoListItemDataMapper.dart';
import 'package:coupleutils/domain/model/ClassicResponse.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class API {
  static const String BASE_URL = "http://thomasboy.fr/couple_utils_api/public/";

  Future<List<ShopListItemEntity>> fetchShopItemsList() async {
    final response = await http.Client().get(BASE_URL + 'shopItemList');
    return compute(parseShopListItem, response.body);
  }

  Future<ClassicResponse> sendShopItem(String text) async {
    final response = await http.Client()
        .post(BASE_URL + 'addShopItem', body: json.encode({'nameItem': text}));

    return compute(parseSendItemResponse, response.body);
  }

  Future<bool> deleteShopItemById(String idItem) async {
    final response = await http.Client().post(
      BASE_URL + 'deleteItemById/$idItem',
    );
    return compute(parseDeleteShopItemResponse, response.body);
  }

  Future<bool> updateShopItemById(String idItem) async {
    final response = await http.Client().patch(
      'http://thomasboy.fr/couple_utils_api/public/updateShopItem/$idItem',
    );
    return compute(parseUpdateShopItemResponse, response.body);
  }

  Future<List<TodoListItemEntity>> fetchTodoItemsList() async {
    final response = await http.Client().get(BASE_URL + 'shopItemList');
    return compute(parseTodoListItem, response.body);
  }
}
