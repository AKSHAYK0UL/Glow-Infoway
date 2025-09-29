import 'package:flutter/material.dart';
import 'package:msg_91/features/login/presentation/screens/login_screen.dart';

class ResendSection extends StatelessWidget {
  final int seconds;
  final VoidCallback onResend;

  const ResendSection({
    super.key,
    required this.seconds,
    required this.onResend,
  });

  @override
  Widget build(BuildContext context) {
    if (seconds > 0) {
      return Text("Resend OTP in $seconds seconds");
    }
    return TextButton(onPressed: onResend, child: const Text("Resend OTP"));
  }
}

class ChangeNumberButton extends StatelessWidget {
  const ChangeNumberButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const LoginScreen()),
          (route) => false,
        );
      },
      child: const Text("Change Number"),
    );
  }
}
