import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:rentersparadise/src/app.dart';
import 'package:rentersparadise/src/core/bloc/cubit/favourite_properties_cubit.dart';
import 'package:rentersparadise/src/core/bloc/cubit/notification_cubit.dart';
import 'package:rentersparadise/src/core/bloc/cubit/select_property_images_cubit.dart';
import 'package:rentersparadise/src/core/bloc/cubit/walkthrough_cubit.dart';
import 'package:rentersparadise/src/core/services/push_notification.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await PushNotification.init();
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => WalkthroughCubit(),
      ),
      BlocProvider(create: (context) => NotificationCubit()),
      BlocProvider(create: (context) => FavouritePropertiesCubit()),
      BlocProvider(create: (context) => SelectPropertyImagesCubit())
    ], child: MyApp()),
  );
}
