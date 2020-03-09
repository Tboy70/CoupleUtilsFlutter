import 'dart:async';

import 'package:coupleutils/data/repository/ShopListRepositoryImpl.dart';
import 'package:coupleutils/domain/model/ClassicResponse.dart';
import 'package:coupleutils/domain/model/ShopListItem.dart';
import 'package:coupleutils/domain/repository/ShopListRepository.dart';

class ShopListBloc {
  final ShopListRepository shopListRepository = ShopListRepositoryImpl();

  Future<List<ShopListItem>> fetchShopItemsList() =>
      shopListRepository.getShopItemList();

  Future<ClassicResponse> sendShopItem(String text) =>
      shopListRepository.sendShopItem(text);

  Future<bool> deleteShopItem(String idItem) =>
      shopListRepository.deleteShopItemById(idItem);

  Future<bool> updateShopItem(String idItem) =>
      shopListRepository.updateShopItemById(idItem);
}
