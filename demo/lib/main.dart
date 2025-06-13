import 'package:demo/features/auth/presentation/blocs/auth_bloc.dart';
import 'package:demo/features/auth/presentation/pages/login_page.dart';
import 'package:demo/features/favorites/presentation/blocs/favorite_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (context) => AuthBloc()),
        BlocProvider<FavoriteBloc>(create: (context) => FavoriteBloc()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(body: LoginPage()),
      ),
    );
  }
}
