import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:rentersparadise/src/core/bloc/cubit/walkthrough_cubit.dart';
import 'package:rentersparadise/src/views/screens/onboard_screens/onboarding.dart';
import 'package:rentersparadise/src/views/screens/onboard_screens/splash_screen.dart';

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

class MyApp extends StatelessWidget {
  static Map<int, Color> color = {
    50: Color.fromRGBO(230, 120, 23, .1),
    100: Color.fromRGBO(230, 120, 23, .2),
    200: Color.fromRGBO(230, 120, 23, .3),
    300: Color.fromRGBO(230, 120, 23, .4),
    400: Color.fromRGBO(230, 120, 23, .5),
    500: Color.fromRGBO(230, 120, 23, .6),
    600: Color.fromRGBO(230, 120, 23, .7),
    700: Color.fromRGBO(230, 120, 23, .8),
    800: Color.fromRGBO(230, 120, 23, .9),
    900: Color.fromRGBO(230, 120, 23, 1),
  };

  final MaterialColor colorCustom = MaterialColor(0xffe67f17, color);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Renters Paradise',
        theme: ThemeData(
          primarySwatch: colorCustom,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: BlocBuilder<WalkthroughCubit, WalkthroughState>(
          builder: (context, state) {
            if (state is WalkthroughInitial) {
              return MySplashScreenPage();
            } else {
              return Onboarding();
            }
          },
        ));
  }
}
