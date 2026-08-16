import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/blocs/cart_bloc/cart_bloc.dart';
import 'package:store/root_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CartBloc(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: RootScreen(),
      ),
    );
  }
}