import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:fireimage/cubit/image_cubit.dart';
import 'package:fireimage/helpers/dio.dart';
import 'package:fireimage/screens/main_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ImageCubit()
        ..initAudio()
        ..selectData()
        ..getImage(),
      child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.grey,
          ),
          debugShowCheckedModeBanner: false,
          home: AnimatedSplashScreen(
            splashIconSize: 256,
            backgroundColor: Colors.black,
      splash: 'assets/images/playstore.png',
      nextScreen:const MainHome(),
      splashTransition: SplashTransition.fadeTransition,
    )),
    );
  }
}
