import 'package:flutter/material.dart';
import 'package:msg_91/features/login/bloc/bloc/login_bloc.dart';

class LoginActionButton extends StatelessWidget {
  final LoginState state;
  final VoidCallback onPressed;

  const LoginActionButton({
    super.key,
    required this.state,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    if (state is LoginLoading) {
      return const CircularProgressIndicator();
    }
    return ElevatedButton(onPressed: onPressed, child: const Text("Send OTP"));
  }
}
