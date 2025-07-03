import 'package:flutter/material.dart';
import 'package:practice_riverpod/simple_provider.dart';
import 'package:practice_riverpod/state_provider.dart';

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
            StateProviderStatefull(),
          ],
        ),
      ),
    );
  }
}
