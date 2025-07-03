import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';

// final sliderState = StateProvider<double>((ref) => 0.0);
final sliderState = StateProvider<AppSlider>(
  (ref) => AppSlider(slider: 0.0, isData: false),
);

class MultipleState extends ConsumerWidget {
  const MultipleState({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('show something..');
    return Column(
      children: [
        //color conrainer 300 x 300 - state 01
        Consumer(
          builder: (context, ref, child) {
            final val = ref.watch(sliderState);
            return Container(
              width: 300,
              height: 300,
              color: Colors.green.withValues(alpha: val.slider),
            );
          },
        ),

        //slider - state 01
        Consumer(
          builder: (context, ref, child) {
            final slider = ref.watch(sliderState.select((val) => val.slider));
            debugPrint('slider');
            return Slider(
              value: slider,
              onChanged: (val) {
                final stateSlider = ref.read(sliderState.notifier);
                stateSlider.state = stateSlider.state.copywith(slider: val);
              },
            );
          },
        ),
        //state 02
        Consumer(
          builder: (context, ref, child) {
            final isData = ref.watch(sliderState.select((val) => val.isData));
            debugPrint('isData - state02');
            return ElevatedButton(
              onPressed: () {
                final stateSlider = ref.read(sliderState.notifier);
                stateSlider.state = stateSlider.state.copywith(isData: !isData);
              },
              child: Text(isData ? 'Slider is ON' : 'Slider is OFF'),
            );
          },
        ),
      ],
    );
  }
}

class AppSlider {
  final double slider;
  final bool isData;
  AppSlider({required this.slider, required this.isData});
  //copywith()
  AppSlider copywith({double? slider, bool? isData}) {
    return AppSlider(
      slider: slider ?? this.slider,
      isData: isData ?? this.isData,
    );
  }
}
