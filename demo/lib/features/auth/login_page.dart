import 'package:demo/core/theme/color_palette.dart';
import 'package:demo/features/app/main_page.dart';
import 'package:demo/features/home/presentation/blocs/shoe_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isVisible = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              cursorColor: ColorPalette.primaryColor,
              decoration: InputDecoration(
                hintText: 'Username',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide(
                    width: 2,
                    color: ColorPalette.primaryColor,
                  ),
                ),
                suffixIcon: Icon(Icons.person),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              cursorColor: ColorPalette.primaryColor,

              decoration: InputDecoration(
                hintText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide(
                    width: 2,
                    color: ColorPalette.primaryColor,
                  ),
                ),
                suffixIcon: IconButton(
                  onPressed: () => {
                    setState(() {
                      _isVisible = !_isVisible;
                    }),
                  },
                  icon: Icon(
                    _isVisible ? Icons.visibility_off : Icons.visibility,
                  ),
                ),
              ),
              obscureText: !_isVisible,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              child: FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: ColorPalette.primaryColor,
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => BlocProvider(
                      create: (context) => ShoeBloc(),
                      child: MainPage())),
                  );
                },
                child: Text("Sign in"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
