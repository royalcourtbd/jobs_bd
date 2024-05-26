import 'dart:async';

import 'package:get/get.dart';
import 'package:jobs_bd/core/base/base_presenter.dart';
import 'package:jobs_bd/presentation/splash_screen/presenter/splash_screen_ui_state.dart';

class SplashScreenPresenter extends BasePresenter<SplashScreenUiState> {
  final uiState = SplashScreenUiState.empty().obs;
  SplashScreenUiState get currentUiState => uiState.value;

  @override
  Future<void> addUserMessage(String message) async {
    uiState.value = currentUiState.copyWith(message: message);
  }

  @override
  Future<void> toggleLoading({required bool loading}) async {
    uiState.value = currentUiState.copyWith(isLoading: loading);
  }
}
