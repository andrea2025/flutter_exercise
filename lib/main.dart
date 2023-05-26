import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vesti_exercise/utils/constants.dart';
import 'package:vesti_exercise/staff_page.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vesti Exercise',
      theme: kThemeData,
      debugShowCheckedModeBanner: false,
      home: const StaffPage(),
    );
  }
}

