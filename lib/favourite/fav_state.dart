import 'package:practice_riverpod/favourite/item.dart';

class FavState {
  final List<Item> allItems;
  final List<Item> favItems;
  final String query;

  FavState({
    required this.allItems,
    required this.favItems,
    required this.query,
  });
  FavState copywith({
    List<Item>? allItems,
    List<Item>? favItems,
    String? query,
  }) {
    return FavState(
      allItems: allItems ?? this.allItems,
      favItems: favItems ?? this.favItems,
      query: query ?? this.query,
    );
  }
}
