import 'package:coupleutils/data/api/API.dart';
import 'package:coupleutils/data/mapper/ShopListItemDataMapper.dart';
import 'package:coupleutils/domain/model/ClassicResponse.dart';
import 'package:coupleutils/domain/model/ShopListItem.dart';
import 'package:coupleutils/domain/repository/ShopListRepository.dart';

class ShopListRepositoryImpl extends ShopListRepository {
  final api = API();
  ShopListItemDataMapper shopListItemDataMapper = ShopListItemDataMapper();

  @override
  Future<List<ShopListItem>> getShopItemList() {
    return api.fetchShopItemsList().then((onValue) {
      return shopListItemDataMapper.transformEntityToModel(onValue);
    });
  }

  Future<ClassicResponse> sendShopItem(String text) => api.sendShopItem(text);

  Future<bool> deleteShopItemById(String idItem) =>
      api.deleteShopItemById(idItem);

  Future<bool> updateShopItemById(String idItem) =>
      api.updateShopItemById(idItem);
}
