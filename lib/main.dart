import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:rentersparadise/src/app.dart';
import 'package:rentersparadise/src/core/bloc/cubit/walkthrough_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => WalkthroughCubit(),
      ),
    ], child: MyApp()),
  );
}
