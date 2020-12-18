import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentersparadise/src/core/bloc/cubit/notification_cubit.dart';
import 'package:rentersparadise/src/core/models/notification_model.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    final notificatonCubit = context.bloc<NotificationCubit>();
    notificatonCubit.loadNotifications();
    return BlocBuilder<NotificationCubit, NotificationState>(
        builder: (context, state) {
        if (state is NotificationInitial) {
          return initialNotification();
        } else if (state is NotificationLoading) {
          return loadingNotification();
        } else if (state is NotificationLoaded) {
          return doneLoadingNotification(state.notificationModel);
        } else if (state is NotificationError) {
          return Center(
            child: Text("error"),
          );
        } else {
          return initialNotification();
        }
      });
  }

  Widget initialNotification() {
    return Center(
      child: Text("notifications"),
    );
  }

  Widget loadingNotification() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget doneLoadingNotification(List<NotificationModel> _notificationList) {
    return ListView.builder(
        itemCount: _notificationList.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.only(left:10.0, right: 10.0),
            child: Card(
                  child: ListTile(
                    leading: 
                    _notificationList[index].status == "active"
                    ?  Image.asset("assets/notify_success.png")
                    : Image.asset("assets/notify_not_success,png"),
                subtitle: Text(
                  _notificationList[index].message,
                style: TextStyle(
                  fontSize: 16.0
                ),),
              ),
            ),
          );
        });
  }
}
