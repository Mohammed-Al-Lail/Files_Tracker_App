import 'package:files_tracker_app/Screens/home.dart';
import 'package:files_tracker_app/providers/dateProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context) => dataProvider(),

      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: home(),
      ),
    );
  }
}

