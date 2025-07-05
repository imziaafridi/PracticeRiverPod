import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice_riverpod/favourite/fav_provider.dart';

class FavView extends ConsumerWidget {
  const FavView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fav = ref.watch(favProvider);
    return GestureDetector(
      onDoubleTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("FAVOURITE APP"),
          centerTitle: false,
          actions: [
            //menu buttons
            PopupMenuButton(
              onSelected: (value) => ref.read(favProvider.notifier).fav(value),
              itemBuilder: (context) {
                return [
                  PopupMenuItem(value: 'All', child: Text('All')),
                  PopupMenuItem(value: 'Fav', child: Text('Fav')),
                ];
              },
            ),
          ],
        ),

        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Divider(),
              SizedBox(height: 80),
              //search
              TextField(
                onChanged: (value) =>
                    ref.read(favProvider.notifier).filterList(value),
                decoration: InputDecoration(
                  label: Text('Search'),
                  border: OutlineInputBorder(),
                ),
              ),
              //items
              Expanded(
                child: ListView.builder(
                  itemCount: fav.favItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    final item = fav.favItems[index];
                    return ListTile(
                      title: Text(item.name),
                      trailing: Icon(
                        item.isFav ? Icons.favorite : Icons.favorite_outline,
                        color: item.isFav ? Colors.red.shade600 : Colors.grey,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ref.read(favProvider.notifier).addFavs();
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
