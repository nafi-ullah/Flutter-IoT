import 'package:flutter/material.dart';
import 'package:pera_on/home_screen.dart';
import 'package:pera_on/splash_screen.dart';
import 'package:pera_on/test_patch.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:battery_plus/battery_plus.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Groceries',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 246, 180, 48),
          brightness: Brightness.light,
          surface: const Color.fromARGB(255, 246, 127, 48),
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 246, 180, 48),
      ),
      home: SplashScreen(),
    );
  }
}