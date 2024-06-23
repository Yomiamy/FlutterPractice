import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_practice/bloc/increment_count_with_test/bloc/increment_count_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("[Test Group] IncrementCountState Test", () {
    late IncrementCountBloc bloc;

    setUp(() {
      bloc = IncrementCountBloc();
    });

    test("Init state", (){
      expect(bloc.state, isA<IncrementCountState>());
      expect((bloc.state as IncrementCountState?)?.count ?? 0, isZero);
    });
  });

  group("[Test Group] Bloc Test", () {
    late IncrementCountBloc bloc;

    setUp(() {
      bloc = IncrementCountBloc();
    });

    blocTest("Add IncrementEvent",
        build: () => bloc,
        act: (bloc) => bloc.add(IncrementCountEvent()),
        verify: (bloc) => expect((bloc.state as IncrementCountState).count, isNonZero)
    );
  });

  group("[Test Group] UI Test", () {
    //TODO: 到此
  });
}