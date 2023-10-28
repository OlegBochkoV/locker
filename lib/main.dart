import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locker/domain/state/mainbloc/main_bloc.dart';
import 'package:locker/domain/state/navbarbloc/navbar_bloc.dart';
import 'package:locker/presentation/home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => NavBarBloc()),
        BlocProvider(create: (_) => MainBloc()),
      ],
      child: const MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
