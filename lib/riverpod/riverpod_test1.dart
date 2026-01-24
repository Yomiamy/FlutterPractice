import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateNotifierProvider<CounterNotifier, int>((ref) => CounterNotifier());

class CounterNotifier extends StateNotifier<int> {
  CounterNotifier() : super(0);

  void increment() => state++;

  void decrement() => state--;

  void reset() => state = 0;
}

class RiverpodTest1 extends StatefulWidget {
  const RiverpodTest1({super.key});

  @override
  State<RiverpodTest1> createState() => _RiverpodTest1State();
}

class _RiverpodTest1State extends State<RiverpodTest1> {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("RiverpodTest1"),
      ),
      body: const _Body(),
    ));
  }
}

class _Body extends ConsumerWidget {
  const _Body({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);
    return Column(
      children: <Widget>[
        Text('Value is $count'),
        ElevatedButton(
          onPressed: () => ref.read(counterProvider.notifier).increment(),
          child: const Text('Increment'),
        ),
        ElevatedButton(
          onPressed: () => ref.read(counterProvider.notifier).decrement(),
          child: const Text('Decrement'),
        )
      ],
    );
  }
}
