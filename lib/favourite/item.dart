class Item {
  final int id;
  final String name;
  final bool isFav;

  Item({required this.id, required this.name, required this.isFav});

  Item copywith({int? id, String? name, bool? isFav}) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      isFav: isFav ?? this.isFav,
    );
  }
}
