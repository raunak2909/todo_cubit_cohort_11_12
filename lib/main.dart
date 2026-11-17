import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit_cohort_11_12/db_cubit.dart';
import 'package:todo_cubit_cohort_11_12/db_helper.dart';
import 'package:todo_cubit_cohort_11_12/home_page.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => DbCubit(DbHelper.getInstance()),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: HomePage(),
    );
  }
}
