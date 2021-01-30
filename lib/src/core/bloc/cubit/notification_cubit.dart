import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rentersparadise/src/core/models/notification_model.dart';
import 'package:rentersparadise/src/core/services/fetch_notifications.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitial());

  List<NotificationModel> _notificationList = [];

  Future<void> loadNotifications() async {
    try {
      emit(NotificationLoading());
      _notificationList = await FetchNotification.getNotifications();
      emit(NotificationLoaded(_notificationList));
    } on Exception {
      emit(NotificationError("Check your internet connection"));
    }
  }
}
