import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc.dart';
import 'event.dart';
import 'state.dart';

class IncrementCountPage extends StatefulWidget {
  const IncrementCountPage({super.key});

  @override
  State<IncrementCountPage> createState() => _IncrementCountPageState();
}

class _IncrementCountPageState extends State<IncrementCountPage> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => IncrementCountBloc(),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final bloc = context.read<IncrementCountBloc>();

    return Scaffold(
        appBar: AppBar(
          title: const Text('累加1'),
        ),
        body: Container(
            child: BlocBuilder<IncrementCountBloc, BaseState>(
                bloc: bloc,
                builder: (context, state) {
                  return Column(
                    children: [
                      Text('Count = ${state.count}'),
                      IconButton(onPressed: () {
                        bloc.add(IncrementCountEvent());
                      }, icon: const Icon(Icons.add)),
                      IconButton(onPressed: () {
                        bloc.add(InitCountEvent());
                      }, icon: const Icon(Icons.lock_reset_outlined))
                    ]
                  );
                }
            )
        )
    );
  }
}

