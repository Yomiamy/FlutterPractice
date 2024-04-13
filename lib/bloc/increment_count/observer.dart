import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

class IncrementObserver extends BlocObserver {

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    debugPrint("$change");
  }

  @override
  void onTransition(
      Bloc<dynamic, dynamic> bloc, Transition<dynamic, dynamic> transition) {
        super.onTransition(bloc, transition);
    debugPrint("$transition");
  }
  
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugPrint("StackTrace: $stackTrace");
    super.onError(bloc, error, stackTrace);
  }
}