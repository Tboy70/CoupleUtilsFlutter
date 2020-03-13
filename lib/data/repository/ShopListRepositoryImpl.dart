import 'package:coupleutils/data/api/API.dart';
import 'package:coupleutils/data/mapper/ShopListItemDataMapper.dart';
import 'package:coupleutils/data/mapper/TodoListItemDataMapper.dart';
import 'package:coupleutils/domain/model/ClassicResponse.dart';
import 'package:coupleutils/domain/model/ShopListItem.dart';
import 'package:coupleutils/domain/repository/ShopListRepository.dart';

class ShopListRepositoryImpl extends ShopListRepository {
  final api = API();
  ShopListItemDataMapper shopListItemDataMapper = ShopListItemDataMapper();
  TodoListItemDataMapper todoListItemDataMapper = TodoListItemDataMapper();

  @override
  Future<List<ShopListItem>> getShopItemList() {
    return api.fetchShopItemsList().then((onValue) {
      return shopListItemDataMapper.transformEntityToModel(onValue);
    });
  }

  @override
  Future<ClassicResponse> sendShopItem(String text) => api.sendShopItem(text);

  @override
  Future<bool> deleteShopItemById(String idItem) =>
      api.deleteShopItemById(idItem);

  @override
  Future<bool> updateShopItemById(String idItem) =>
      api.updateShopItemById(idItem);
}
