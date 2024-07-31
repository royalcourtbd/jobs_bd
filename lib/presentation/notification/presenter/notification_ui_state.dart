import 'package:jobs_bd/core/base/base_ui_state.dart';
import 'package:jobs_bd/data/database/db_helper.dart';

class NotificationUiState extends BaseUiState {
  const NotificationUiState({
    required super.isLoading,
    required super.userMessage,
    required this.notificationList,
  });

  factory NotificationUiState.empty() {
    return const NotificationUiState(
      isLoading: false,
      userMessage: '',
      notificationList: [],
    );
  }

  final List<NotificationModelData> notificationList;

  @override
  List<Object?> get props => [
        isLoading,
        userMessage,
        notificationList,
      ];

  NotificationUiState copyWith({
    bool? isLoading,
    String? userMessage,
    List<NotificationModelData>? notificationList,
  }) {
    return NotificationUiState(
      isLoading: isLoading ?? this.isLoading,
      userMessage: userMessage ?? this.userMessage,
      notificationList: notificationList ?? this.notificationList,
    );
  }
}
