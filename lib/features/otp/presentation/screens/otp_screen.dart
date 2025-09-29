import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msg_91/features/home/presentation/screens/home_screen.dart';
import 'package:msg_91/features/otp/bloc/bloc/otp_bloc.dart';
import 'package:msg_91/features/otp/presentation/widgets/otp_field.dart';
import 'package:msg_91/features/otp/presentation/widgets/resend_section.dart';
import 'package:msg_91/features/otp/presentation/widgets/verify_button.dart';

class OTPScreen extends StatefulWidget {
  final String reqId;
  final String phoneNumber;

  const OTPScreen({super.key, required this.reqId, required this.phoneNumber});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final otpController = TextEditingController();
  late Timer _timer;
  int _seconds = 60;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _seconds = 60;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_seconds == 0) {
        timer.cancel();
      } else {
        setState(() {
          _seconds--;
        });
      }
    });
  }

  @override
  void dispose() {
    otpController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Verify OTP")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocConsumer<OTPBloc, OTPState>(
          listener: (context, state) {
            if (state is OTPVerified) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const MainScreen()),
                (route) => false,
              );
            } else if (state is OTPError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            } else if (state is OTPResent) {
              _startTimer();
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text("OTP Resent")));
            }
          },
          builder: (context, state) {
            return Column(
              children: [
                Text("OTP sent to ${widget.phoneNumber}"),
                const SizedBox(height: 20),
                OTPInputField(controller: otpController),
                const SizedBox(height: 20),
                VerifyButton(
                  state: state,
                  onPressed: () {
                    context.read<OTPBloc>().add(
                      VerifyOTPEvent(widget.reqId, otpController.text),
                    );
                  },
                ),
                const SizedBox(height: 20),
                ResendSection(
                  seconds: _seconds,
                  onResend: () {
                    print(widget.reqId);
                    context.read<OTPBloc>().add(ResendOTPEvent(widget.reqId));
                  },
                ),
                ChangeNumberButton(),
              ],
            );
          },
        ),
      ),
    );
  }
}
