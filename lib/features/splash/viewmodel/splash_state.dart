import 'package:freezed_annotation/freezed_annotation.dart';

part "splash_state.freezed.dart";

enum SplashStatus {loading, ready} 

@freezed
abstract class SplashState with _$SplashState{
  const factory SplashState({
    @Default(SplashStatus.loading) SplashStatus status,
  }) = _SplashState;
}