import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice_riverpod/search_notifer/search_notifier_provider.dart';

//SIMPLE EXMPl

// class SearchView extends ConsumerWidget {
//   const SearchView({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     debugPrint('val');
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           TextFormField(
//             onChanged: (value) {
//               ref.read(searchNotifier.notifier).search(value);
//             },
//           ),
//           SizedBox(height: 20),
//           Consumer(
//             builder: (context, ref, child) {
//               final val = ref.watch(searchNotifier);
//               debugPrint('consumer val');
//               return Text(val);
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

class SearchView extends ConsumerWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('val');
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              onChanged: (value) {
                ref.read(searchNotifier.notifier).search(value);
              },
            ),
            SizedBox(height: 20),
            Consumer(
              builder: (context, ref, child) {
                final query = ref.watch(
                  searchNotifier.select((select) => select.query),
                );
                debugPrint('query');
                return Text(query);
              },
            ),
            Consumer(
              builder: (context, ref, child) {
                final isChanged = ref.watch(
                  searchNotifier.select((select) => select.isChanged),
                );
                debugPrint('isChanged');
                return Switch(
                  value: isChanged,
                  onChanged: (val) =>
                      ref.read(searchNotifier.notifier).onChanged(val),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
