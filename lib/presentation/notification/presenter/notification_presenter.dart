import 'package:jobs_bd/core/base/base_presenter.dart';
import 'package:jobs_bd/data/database/db_helper.dart';
import 'package:jobs_bd/presentation/notification/presenter/notification_ui_state.dart';

class NotificationPresenter extends BasePresenter<NotificationUiState> {
  final Obs<NotificationUiState> uiState = Obs(NotificationUiState.empty());
  NotificationUiState get currentUiState => uiState.value;

  final AppDatabase appDatabase = AppDatabase();

  Future<void> fetchNotifications() async {
    uiState.value = currentUiState.copyWith(isLoading: true);
    final List<NotificationModelData> notifications =
        await appDatabase.getAllNotifications();
    uiState.value = currentUiState.copyWith(notificationList: notifications);
    uiState.value = currentUiState.copyWith(isLoading: false);
  }

  Future<void> deleteNotificationById(int id) async {
    uiState.value = currentUiState.copyWith(isLoading: true);
    await appDatabase.deleteNotificationById(id);
    fetchNotifications();
    uiState.value = currentUiState.copyWith(isLoading: false);
  }

  @override
  Future<void> addUserMessage(String message) async {
    uiState.value = currentUiState.copyWith(userMessage: message);
  }

  @override
  Future<void> toggleLoading({required bool loading}) async {
    uiState.value = currentUiState.copyWith(isLoading: loading);
  }
}
