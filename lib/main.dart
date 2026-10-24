import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:hungery/core/constants/app_colors.dart';
import 'package:hungery/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  debugPaintSizeEnabled = false; 
 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hungry',
      theme: ThemeData(
        splashColor: Colors.transparent,
        scaffoldBackgroundColor: AppColors.colorWhite,
      ),

      debugShowCheckedModeBanner: false,
      home: const SplashView(),
    );
  }
}
