import 'package:coupleutils/domain/model/ClassicResponse.dart';
import 'package:coupleutils/domain/model/ShopListItem.dart';

abstract class ShopListRepository {
  Future<List<ShopListItem>> getShopItemList();

  Future<ClassicResponse> sendShopItem(String text);

  Future<bool> deleteShopItemById(String idItem);

  Future<bool> updateShopItemById(String idItem);
}
