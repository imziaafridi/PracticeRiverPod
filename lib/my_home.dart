import 'package:flutter/material.dart';
import 'package:practice_riverpod/multiple_state.dart';
import 'package:practice_riverpod/search_notifer/search_view.dart';
import 'package:practice_riverpod/simple_provider.dart';
import 'package:practice_riverpod/state_provider.dart';
import 'package:practice_riverpod/todo/item_view.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // SimpleProviderStateLess(),
            // SimpleProviderStateFull(),
            // StateProviderStateless(),
            // StateProviderStatefull(),
            // MultipleState(),
            // SearchView(),
            // ItemView(),
          ],
        ),
      ),
    );
  }
}
