import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    // TODO: implement onEvent
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // TODO: implement onError
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    // TODO: implement onChange
    debugPrint('Bloc Change State =>>> ${change}');
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    // TODO: implement onChange
    debugPrint('<< Bloc Close State =>>> $bloc >>');
  }

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    // TODO: implement onChange
    debugPrint('<< Bloc Create State =>>> $bloc >>');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    // TODO: implement onChange
  }
}
