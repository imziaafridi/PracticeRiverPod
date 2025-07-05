import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice_riverpod/todo/item_provider.dart';

class ItemView extends ConsumerWidget {
  const ItemView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(itemProvider);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: item.length,
              itemBuilder: (context, index) {
                final data = item[index];
                return ListTile(
                  title: Text(data.name),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () => ref
                            .read(itemProvider.notifier)
                            .updateItem(data.id, 'MR_KHAN'),
                        icon: Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () =>
                            ref.read(itemProvider.notifier).removeItem(data.id),
                        icon: Icon(Icons.delete, color: Colors.red.shade600),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(itemProvider.notifier).addItem('ZIA AFRIDI');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
