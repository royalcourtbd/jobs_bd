import 'dart:async';

import 'package:get/get.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:jobs_bd/core/base/base_presenter.dart';
import 'package:jobs_bd/presentation/splash_screen/presenter/splash_screen_ui_state.dart';

class SplashScreenPresenter extends BasePresenter<SplashScreenUiState> {
  final uiState = SplashScreenUiState.empty().obs;
  SplashScreenUiState get currentUiState => uiState.value;
  StreamSubscription? subscription;

  @override
  void onInit() {
    super.onInit();
    checkInternetConnection();
  }

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }

  void checkInternetConnection() {
    subscription = InternetConnection().onStatusChange.listen((event) {
      switch (event) {
        case InternetStatus.connected:
          uiState.value = currentUiState.copyWith(isInternetConnected: true);
          addUserMessage('Internet Connected');
          toggleLoading(loading: false);
          break;
        case InternetStatus.disconnected:
          uiState.value = currentUiState.copyWith(isInternetConnected: false);
          addUserMessage('No Internet Connection');
          toggleLoading(loading: false);
          break;
        default:
          uiState.value = currentUiState.copyWith(isInternetConnected: false);
          addUserMessage('No Internet Connection');
          toggleLoading(loading: false);
          break;
      }
    });
  }

  @override
  Future<void> addUserMessage(String message) async {
    uiState.value = currentUiState.copyWith(message: message);
  }

  @override
  Future<void> toggleLoading({required bool loading}) async {
    uiState.value = currentUiState.copyWith(isLoading: loading);
  }
}
