import 'package:demo/core/theme/color_palette.dart';
import 'package:demo/features/app/main_page.dart';
import 'package:demo/features/auth/presentation/blocs/auth_bloc.dart';
import 'package:demo/features/auth/presentation/blocs/auth_event.dart';
import 'package:demo/features/auth/presentation/blocs/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isVisible = false;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is SuccessAuthState) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => MainPage(),
            ),
          );
        } else if (state is FailureAuthState) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          final isLoading = state is LoadingAuthState;
          return Stack(
            children: [
              AbsorbPointer(
                absorbing: isLoading,
                child: Container(
                  decoration: BoxDecoration(
                    color: isLoading
                        ? Colors.grey.shade200
                        : Colors.transparent,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          autocorrect: false,
                          controller: _usernameController,
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
                          controller: _passwordController,
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
                                _isVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility,
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
                              context.read<AuthBloc>().add(
                                SignInEvent(
                                  username: _usernameController.text,
                                  password: _passwordController.text,
                                ),
                              );
                            },
                            child: Text("Sign in"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (isLoading)
                Center(
                  child: CircularProgressIndicator(
                    color: ColorPalette.primaryColor,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
