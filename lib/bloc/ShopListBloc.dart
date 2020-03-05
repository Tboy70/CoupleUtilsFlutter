import 'package:coupleutils/model/ShopListItem.dart';
import 'package:coupleutils/repository/Repository.dart';

class ShopListBloc {
  final repository = Repository();

  Future<List<ShopListItem>> fetchShopItemsList() =>
      repository.getShopItemList();
}
