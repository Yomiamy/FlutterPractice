import 'package:bloc/bloc.dart';
import 'event.dart';
import 'state.dart';
import 'package:flutter/material.dart';

class IncrementCountBloc extends Bloc<BaseEvent, BaseState> {
  IncrementCountBloc() : super(InitState()) {
    on<BaseEvent>(_eventHandler);
  }

  void _eventHandler(BaseEvent event, Emitter<BaseState> emit) async {
    switch (event.runtimeType) {
      case IncrementCountEvent:
        IncrementCountState state = IncrementCountState();
        emit(state);
        break;
      case InitCountEvent:
        InitState state = InitState();
        emit(state);
    }
  }

  @override
  void onChange(Change<BaseState> change) {
    super.onChange(change);

    debugPrint("onChange: $change");
  }
}
