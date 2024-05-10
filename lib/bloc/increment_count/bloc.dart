import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:stream_transform/stream_transform.dart';
import 'event.dart';
import 'state.dart';
import 'package:flutter/material.dart';

class IncrementCountBloc extends Bloc<BaseEvent, BaseState> {
  IncrementCountBloc() : super(InitState()) {
    on<BaseEvent>(
        _eventHandler,
      transformer: debounce(const Duration(milliseconds: 300))
    );
  }

  EventTransformer<T> debounce<T>(Duration duration) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
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

  @override
  void onTransition(Transition<BaseEvent, BaseState> transition) {
    super.onTransition(transition);

    debugPrint("onTransition: $transition");
  }
}
