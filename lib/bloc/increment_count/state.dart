abstract class BaseState {
  static int _count = 0;

  int get count => _count;
  set count(int value) {
    _count = value;
  }

  void increment() => count = count + 1;

  void reset() {
    count = 0;
  }
}

class InitState extends BaseState {
  InitState() {
    reset();
  }
}

class IncrementCountState extends BaseState {
  IncrementCountState() {
    increment();
  }
}
