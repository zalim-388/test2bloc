import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test2bloc/bloc.dart';
import 'package:test2bloc/home.dart';

void main() {
  runApp(
    BlocProvider(
      create: (_) => Counter(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Bloc Home Page'),
    );
  }
}
