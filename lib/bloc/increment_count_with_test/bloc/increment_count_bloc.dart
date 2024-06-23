import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'increment_count_event.dart';
part 'increment_count_state.dart';
part 'increment_count_bloc.freezed.dart';

class IncrementCountBloc extends Bloc<BaseIncrementCountEvent, BaseIncrementCountState> {
  IncrementCountBloc() : super( IncrementCountState()) {
    on<BaseIncrementCountEvent>(_handleEvent);
  }

  Future<void> _handleEvent(BaseIncrementCountEvent event, Emitter<BaseIncrementCountState> emit) async {
    switch(event.runtimeType) {
      case IncrementCountEvent: {
        int count = (state as IncrementCountState?)?.count ?? 0;
        emit(IncrementCountState(count: count + 1));
      }
      default: {}
    }
  }
}
