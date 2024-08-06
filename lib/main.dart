// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'UI/listingPage.dart';
import 'model/jobProvider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => JobProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const ListingPage(),
    );
  }
}

