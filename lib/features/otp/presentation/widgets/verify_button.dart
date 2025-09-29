import 'package:flutter/material.dart';
import 'package:msg_91/features/otp/bloc/bloc/otp_bloc.dart';

class VerifyButton extends StatelessWidget {
  final OTPState state;
  final VoidCallback onPressed;

  const VerifyButton({super.key, required this.state, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    if (state is OTPLoading) {
      return const CircularProgressIndicator();
    }
    return ElevatedButton(
      onPressed: onPressed,
      child: const Text("Verify OTP"),
    );
  }
}
