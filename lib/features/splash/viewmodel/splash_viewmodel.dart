import 'package:pogo/features/splash/viewmodel/splash_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "splash_viewmodel.g.dart";

@riverpod 
class SplashViewModel extends _$SplashViewModel {
  @override 
  SplashState build(){
    _initialize();
    return const SplashState();
  }

  void _initialize()async {
    // simulate the processing delay
    await Future.delayed(const Duration(seconds: 4));
    state = state.copyWith(status: SplashStatus.ready);
  }
} 