part of 'increment_count_bloc.dart';

@freezed
sealed class BaseIncrementCountEvent with _$BaseIncrementCountEvent {

  BaseIncrementCountEvent();

  const factory BaseIncrementCountEvent.started() = _Started;
}

class IncrementCountEvent extends BaseIncrementCountEvent {}
