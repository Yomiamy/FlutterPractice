part of 'timer_bloc.dart';

// TimerStarted：通知TimerBloc开始计时。
// TimerPaused：通知TimerBloc暂停。
// TimerResumed：通知TimerBloc恢复计时。
// TimerReset：通知TimerBloc重置计时器到原来的状态。
// _TimerTicked：通知TimerBloc一个tick已经发生，需要更新它对应的状态。

// TODO: 到此
sealed class TimerEvent {
  const TimerEvent();
}

final class TimerInit extends TimerEvent {
  const TimerInit();
}

final class TimerStarted extends TimerEvent {
  const TimerStarted({required this.duration});
  final int duration;
}

final class TimerPaused extends TimerEvent {
  const TimerPaused();
}

final class TimerResumed extends TimerEvent {
  const TimerResumed();
}

class TimerReset extends TimerEvent {
  const TimerReset();
}

class _TimerTicked extends TimerEvent {
  const _TimerTicked({required this.duration});
  final int duration;
}