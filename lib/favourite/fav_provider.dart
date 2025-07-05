import 'package:practice_riverpod/favourite/fav_state.dart';
import 'package:practice_riverpod/favourite/item.dart';
import 'package:riverpod/riverpod.dart';

final favProvider = StateNotifierProvider<FavNotifier, FavState>(
  (ref) => FavNotifier(),
);

class FavNotifier extends StateNotifier<FavState> {
  FavNotifier() : super(FavState(allItems: [], favItems: [], query: ''));
  //filterSearch
  //addFilter
  //additme
  void addFavs() {
    final List<Item> dummyItems = [
      Item(id: 1, name: 'Alice Johnson', isFav: false),
      Item(id: 2, name: 'Bob Smith', isFav: true),
      Item(id: 3, name: 'Charlie Davis', isFav: false),
      Item(id: 4, name: 'Diana Prince', isFav: true),
      Item(id: 5, name: 'Ethan Hunt', isFav: false),
    ];
    state = state.copywith(
      allItems: dummyItems.toList(),
      favItems: dummyItems.toList(),
    );
  }

  void filterList(String query) {
    state = state.copywith(favItems: _filterQuery(query, state.allItems));
  }

  List<Item> _filterQuery(String query, List<Item> item) {
    if (query.isEmpty) {
      return item;
    }

    return item
        .where((item) => item.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  void fav(String option) {
    state = state.copywith(favItems: _favItem(option, state.allItems));
  }

  List<Item> _favItem(String option, List<Item> item) {
    if (option == 'All') {
      return item;
    }

    return item.where((item) => item.isFav == true).toList();
  }
}
