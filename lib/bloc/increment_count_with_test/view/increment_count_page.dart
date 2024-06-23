import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practice/bloc/increment_count_with_test/bloc/increment_count_bloc.dart';

class IncrementCountPage extends StatefulWidget {
  const IncrementCountPage({super.key});

  @override
  State<IncrementCountPage> createState() => _IncrementCountPageState();
}

class _IncrementCountPageState extends State<IncrementCountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IncrementCountPage'),
      ),
      body: BlocBuilder<IncrementCountBloc, BaseIncrementCountState>(
        builder: (context, state) {
          int count = (state as IncrementCountState?)?.count ?? 0;

          return Text(
              style: const TextStyle(fontSize: 26),
              "Count = $count"
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          context.read<IncrementCountBloc>().add(IncrementCountEvent());
        }
      ),
    );
  }
}
