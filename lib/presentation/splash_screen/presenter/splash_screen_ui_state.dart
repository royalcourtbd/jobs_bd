import 'package:jobs_bd/core/base/base_ui_state.dart';

class SplashScreenUiState extends BaseUiState {
  const SplashScreenUiState({
    required super.isLoading,
    required super.userMessage,
    required this.isConnected,
  });

  factory SplashScreenUiState.empty() {
    return const SplashScreenUiState(
      isLoading: false,
      userMessage: '',
      isConnected: false,
    );
  }

  final bool isConnected;

  @override
  List<Object?> get props => [
        isLoading,
        userMessage,
        isConnected,
      ];

  SplashScreenUiState copyWith({
    bool? isLoading,
    String? message,
    bool? isConnected,
  }) {
    return SplashScreenUiState(
      isLoading: isLoading ?? super.isLoading,
      userMessage: message ?? super.userMessage,
      isConnected: isConnected ?? this.isConnected,
    );
  }
}
