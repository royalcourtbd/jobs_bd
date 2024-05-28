import 'package:jobs_bd/core/base/base_ui_state.dart';

class SplashScreenUiState extends BaseUiState {
  const SplashScreenUiState({
    required super.isLoading,
    required super.userMessage,
    required this.isInternetConnected,
  });

  factory SplashScreenUiState.empty() {
    return const SplashScreenUiState(
      isLoading: false,
      userMessage: '',
      isInternetConnected: false,
    );
  }

  final bool isInternetConnected;

  @override
  List<Object?> get props => [
        isLoading,
        userMessage,
        isInternetConnected,
      ];

  SplashScreenUiState copyWith({
    bool? isLoading,
    String? message,
    bool? isInternetConnected,
  }) {
    return SplashScreenUiState(
      isLoading: isLoading ?? super.isLoading,
      userMessage: message ?? super.userMessage,
      isInternetConnected: isInternetConnected ?? this.isInternetConnected,
    );
  }
}
