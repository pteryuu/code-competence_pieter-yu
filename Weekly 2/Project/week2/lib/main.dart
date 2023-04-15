import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week2/view/home/home.dart';
import 'package:week2/view/home/home_view_model.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<HomeViewModel>(
          create: (context) => HomeViewModel()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
