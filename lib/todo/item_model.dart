class ItemModel {
  String id;
  String name;

  ItemModel({required this.id, required this.name});

  ItemModel copywith({String? id, String? name}) {
    return ItemModel(id: id ?? this.id, name: name ?? this.name);
  }
}
