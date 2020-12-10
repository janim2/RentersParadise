import 'package:flutter/material.dart';
import 'package:rentersparadise/src/core/bloc/app_properties_bloc.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  List<Map<dynamic, String>> notificationsData = [
    {
      "id": "1",
      "status": "success",
      "message": "Property Listing was successful"
    },
    {
      "id": "2",
      "status": "not_success",
      "message": "Property Listing was was not successful"
    },
    {
      "id": "3",
      "status": "cancel",
      "message": "Property Listing was cancelled"
    },
    {
      "id": "4",
      "status": "success",
      "message": "Property Listing was successful"
    },
    {
      "id": "5",
      "status": "not_success",
      "message": "Property Listing was was not successful"
    },
    {
      "id": "6",
      "status": "cancel",
      "message": "Property Listing was cancelled"
    },
    {
      "id": "7",
      "status": "success",
      "message": "Property Listing was successful"
    },
    {
      "id": "8",
      "status": "not_success",
      "message": "Property Listing was was not successful"
    },
    {
      "id": "9",
      "status": "cancel",
      "message": "Property Listing was cancelled"
    },
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        child: SingleChildScrollView(
          child: Column(
            children: [
//              Card(
//                margin: EdgeInsets.all(0),
//                elevation: 7,
//                child: Container(
//                  height: screenHeight / 8,
//                  width: screenWidth,
//                  color: TheColors.orange,
//                  child: Padding(
//                    padding: const EdgeInsets.all(20.0),
//                    child: Text(
//                      "NOTIFICATIONS",
//                      style: TextStyle(
//                          fontSize: 27.0,
//                          fontFamily: "Poppins",
//                          color: Colors.white),
//                    ),
//                  ),
//                ),
//              ),
              Card(
                margin: EdgeInsets.all(20),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: notificationsData.length,
                  itemBuilder: (BuildContext context, int index) {
                    /* String key = notificationsData.keys.elementAt(index); */
                    return Row(
                      children: [
                        notificationsData[index]["status"] == "success"
                            ? Image.asset("assets/notify_success.png")
                            : notificationsData[index]["status"] ==
                                    "not_success"
                                ? Image.asset(
                                    "assets/notify_not_successful.png")
                                : Image.asset("assets/notify_cancel.png"),
                        SizedBox(width: 20),
                        Flexible(
                            child: Text(notificationsData[index]["message"],
                                style: TextStyle(fontSize: 22))),
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    appBloc.updateTitle('NOTIFICATION');
  }

  Widget rowNotification(String status, String message) {
    return Row(
      children: [
        status == "success"
            ? Image.asset("assets/notify_success.png")
            : status == "not_success"
                ? Image.asset("assets/notify_not_success,png")
                : Image.asset("assets/notify_cancel.png"),
        SizedBox(width: 20),
        Text(message, style: TextStyle(fontSize: 25))
      ],
    );
  }

  _fetchNotifications() {
    // TODO: fetch notifications from api

    List<Map<dynamic, String>> notificationsData = [
      {
        "id": "1",
        "status": "success",
        "message": "Property Listing was successful"
      },
      {
        "id": "2",
        "status": "not_success",
        "message": "Property Listing was was not successful"
      },
      {
        "id": "3",
        "status": "cancel",
        "message": "Property Listing was cancelled"
      },
      {
        "id": "4",
        "status": "success",
        "message": "Property Listing was successful"
      },
      {
        "id": "5",
        "status": "not_success",
        "message": "Property Listing was was not successful"
      },
      {
        "id": "6",
        "status": "cancel",
        "message": "Property Listing was cancelled"
      },
      {
        "id": "7",
        "status": "success",
        "message": "Property Listing was successful"
      },
      {
        "id": "8",
        "status": "not_success",
        "message": "Property Listing was was not successful"
      },
      {
        "id": "9",
        "status": "cancel",
        "message": "Property Listing was cancelled"
      },
    ];

    return notificationsData;
  }
}
