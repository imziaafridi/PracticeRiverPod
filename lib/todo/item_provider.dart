import 'package:practice_riverpod/todo/item_model.dart';
import 'package:riverpod/riverpod.dart';

final itemProvider = StateNotifierProvider<ItemNotifier, List<ItemModel>>(
  (ref) => ItemNotifier(),
);

class ItemNotifier extends StateNotifier<List<ItemModel>> {
  ItemNotifier() : super([]);
  //add
  void addItem(String item) {
    final itemMdl = ItemModel(id: DateTime.now().toString(), name: item);
    state.add(itemMdl);
    state = state.toList();
  }

  //remove
  void removeItem(String id) {
    state.removeWhere((item) => item.id == id);
    state = state.toList();
  }

  //update
  void updateItem(String id, String item) {
    final int itemWhere = state.indexWhere((item) => item.id == id);
    state[itemWhere].name = item;
    state = state.toList();
  }
}
