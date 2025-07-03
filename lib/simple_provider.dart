import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final welcome = Provider<String>((ref) {
  return 'welcome to riverpod sdsdsd sdsd';
});

//stateless
class SimpleProviderStateLess extends ConsumerWidget {
  const SimpleProviderStateLess({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wlc = ref.watch(welcome);
    return Center(child: Text(wlc, style: TextStyle(fontSize: 20)));
  }
}

//statefull

class SimpleProviderStateFull extends ConsumerStatefulWidget {
  const SimpleProviderStateFull({super.key});

  @override
  ConsumerState<SimpleProviderStateFull> createState() =>
      _SimpleProviderState();
}

class _SimpleProviderState extends ConsumerState<SimpleProviderStateFull> {
  @override
  Widget build(BuildContext context) {
    final wfc = ref.watch(welcome);
    return Center(child: Text(wfc, style: TextStyle(fontSize: 20)));
  }
}
