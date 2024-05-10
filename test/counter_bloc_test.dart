import 'package:flutter_practice/bloc/increment_count/event.dart';
import 'package:flutter_practice/bloc/increment_count/state.dart';
import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';

import 'package:flutter_practice/bloc/increment_count/bloc.dart';

void main() {
  group("Test Group 1", () {

    late IncrementCountBloc countBloc;

    // Initialize the test object
    setUp(() {
      countBloc = IncrementCountBloc();
    });

    // Test the Init state
    test('initial state is 0', () {
      expect(countBloc.state.count, equals(0));
    });

    // Test the Init IncrementCount action
    blocTest("add(IncrementCountEvent()) test",
        build: () => countBloc,
        act: (bloc) => bloc.add(IncrementCountEvent()),
        expect: () => [IncrementCountState()..count = 2]);
  });
}
