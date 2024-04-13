part of 'timer_bloc.dart';

sealed class TimerState extends Equatable {

  final int duration;

  const TimerState(this.duration);

  @override
  List<Object> get props => [duration];
}

//如果状态是TimerInitial用户可以开始倒计时。
final class TimerInitial extends TimerState {
  const TimerInitial(int duration):super(duration);

  @override
  String toString() => 'TimerInitial { duration: $duration }';
}

//如果状态是TimerRunPause用户可以恢复倒计时和重置计时器。
final class TimerRunPause extends TimerState {
  const TimerRunPause(super.duration);

  @override
  String toString() => 'TimerRunPause { duration: $duration }';
}

//如果状态是TimerRunInProgress用户可以暂停和重置计时器并且可以看到剩余的时间。
final class TimerRunInProgress extends TimerState {
  const TimerRunInProgress(super.duration);

  @override
  String toString() => 'TimerRunInProgress { duration: $duration }';
}

//如果状态是TimerRunComplete用户可以重置计时器。
final class TimerRunComplete extends TimerState {
  const TimerRunComplete() : super(0);
}