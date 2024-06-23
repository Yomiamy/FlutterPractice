part of 'increment_count_bloc.dart';

@freezed
sealed class BaseIncrementCountState with _$BaseIncrementCountState {

  BaseIncrementCountState();

  const factory BaseIncrementCountState.initial() = _Initial;
}

class IncrementCountState extends BaseIncrementCountState {

  int count = 0;

  IncrementCountState({this.count = 0});
}
