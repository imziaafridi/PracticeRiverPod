import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counter = StateProvider<int>((ref) => 0);
final switchState = StateProvider<bool>((ref) => false);

// class StateProviderStateless extends ConsumerWidget {
//   const StateProviderStateless({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // final count = ref.watch(counter);
//     debugPrint('count-0');
// return Column(
//   children: [
//     //text
//     Consumer(
//       builder: (context, ref, child) => Center(
//         child: Text(
//           ref.watch(counter).toString(),
//           style: TextStyle(fontSize: 20),
//         ),
//       ),
//     ),

//     //buttons
//     Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         //--
//         ElevatedButton(
//           onPressed: () {
//             ref.read(counter.notifier).state--;
//             debugPrint('count-01');
//           },
//           child: Text('Minus'),
//         ),
//         //++
//         ElevatedButton(
//           onPressed: () {
//             ref.read(counter.notifier).state++;
//             debugPrint('count-01');
//           },
//           child: Text('add'),
//         ),
//       ],
//     ),
// Consumer(
//     builder: (context, ref, child) {
//       final val = ref.watch(switchState);
//       return Switch(
//         value: val,
//         onChanged: (val) {
//           ref.read(switchState.notifier).state = val;
//           debugPrint('SWITCH STATE: ${ref.watch(switchState)}');
//         },
//       );
//     },
//   ),
//   ],
// );
//   }
// }

class StateProviderStatefull extends ConsumerStatefulWidget {
  const StateProviderStatefull({super.key});

  @override
  ConsumerState<StateProviderStatefull> createState() =>
      _StateProviderStatefullState();
}

class _StateProviderStatefullState
    extends ConsumerState<StateProviderStatefull> {
  @override
  Widget build(BuildContext context) {
    // final switchSate = ref.watch(switchState);
    // final countSate = ref.watch(counter);

    // debugPrint('SWitch Val: $switchSate');
    // debugPrint('count Val: $countSate');
    debugPrint('count Val:');

    return Column(
      children: [
        //text
        Consumer(
          builder: (context, ref, child) => Center(
            child: Text(
              ref.watch(counter).toString(),
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),

        //buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //--
            ElevatedButton(
              onPressed: () {
                ref.read(counter.notifier).state--;
                debugPrint('count-01');
              },
              child: Text('Minus'),
            ),
            //++
            ElevatedButton(
              onPressed: () {
                ref.read(counter.notifier).state++;
                debugPrint('count-01');
              },
              child: Text('add'),
            ),
          ],
        ),
        Consumer(
          builder: (context, ref, child) {
            final val = ref.watch(switchState);
            return Switch(
              value: val,
              onChanged: (val) {
                ref.read(switchState.notifier).state = val;
                debugPrint('SWITCH STATE: ${ref.watch(switchState)}');
              },
            );
          },
        ),
      ],
    );
  }
}
