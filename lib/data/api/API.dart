import 'dart:convert';

import 'package:coupleutils/data/entity/EventEntity.dart';
import 'package:coupleutils/data/entity/ShopListItemEntity.dart';
import 'package:coupleutils/data/entity/TodoListItemEntity.dart';
import 'package:coupleutils/data/mapper/EventItemDataMapper.dart';
import 'package:coupleutils/data/mapper/ShopListItemDataMapper.dart';
import 'package:coupleutils/data/mapper/TodoListItemDataMapper.dart';
import 'package:coupleutils/domain/model/ClassicResponse.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class API {
  static const String BASE_URL = "http://thomasboy.fr/couple_utils_api/public/";

  /// SHOP LIST

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
    final response =
        await http.Client().post(BASE_URL + 'deleteShopItemById/$idItem');
    return compute(parseDeleteShopItemResponse, response.body);
  }

  Future<bool> updateShopItemById(String idItem) async {
    final response =
        await http.Client().patch(BASE_URL + 'updateShopItem/$idItem');
    return compute(parseUpdateShopItemResponse, response.body);
  }

  /// _TODO LIST

  Future<List<TodoListItemEntity>> fetchTodoItemsList() async {
    final response = await http.Client().get(BASE_URL + 'todoItemList');
    return compute(parseTodoListItem, response.body);
  }

  Future<ClassicResponse> sendTodoItem(String text) async {
    final response = await http.Client()
        .post(BASE_URL + 'addTodoItem', body: json.encode({'nameItem': text}));

    return compute(parseSendItemResponse, response.body);
  }

  Future<bool> deleteTodoItemById(String idItem) async {
    final response =
        await http.Client().post(BASE_URL + 'deleteTodoItemById/$idItem');
    return compute(parseDeleteTodoItemResponse, response.body);
  }

  Future<bool> updateTodoItemById(String idItem) async {
    final response =
        await http.Client().patch(BASE_URL + 'updateTodoItem/$idItem');
    return compute(parseUpdateTodoItemResponse, response.body);
  }

  /// CALENDAR

  Future<List<EventEntity>> fetchEventList() async {
    final response = await http.Client().get(BASE_URL + 'eventList');
    return compute(parseEventList, response.body);
  }

  Future<bool> deleteEvent(String idEvent) async {
    final response =
        await http.Client().post(BASE_URL + 'deleteEventById/$idEvent');
    return compute(parseDeleteEventResponse, response.body);
  }

  Future<ClassicResponse> sendEvent(EventEntity eventItemEntity) async {
    final response = await http.Client().post(BASE_URL + 'addEvent',
        body: json.encode(eventItemEntity.toJson()));
    return compute(parseSendItemResponse, response.body);
  }
}
