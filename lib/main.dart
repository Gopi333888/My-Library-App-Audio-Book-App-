import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mylibrary/Screens/AdminPages/Admin.dart';
import 'package:mylibrary/Screens/Models/bookdataModel.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(BookModelAdapter().typeId)) {
    Hive.registerAdapter(BookModelAdapter());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AdminScreen(),
      // home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}