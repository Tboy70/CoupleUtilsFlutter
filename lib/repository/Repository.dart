import 'package:coupleutils/api/API.dart';
import 'package:coupleutils/model/ShopListItem.dart';

class Repository {
  final api = API();

  Future<List<ShopListItem>> getShopItemList() => api.fetchShopItemsList();
}
