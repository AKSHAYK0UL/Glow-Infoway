import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msg_91/features/login/bloc/bloc/login_bloc.dart';
import 'package:msg_91/features/login/presentation/widgets/login_button.dart';
import 'package:msg_91/features/login/presentation/widgets/phone_input_field.dart';
import 'package:msg_91/features/otp/presentation/screens/otp_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is OtpSentState) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => OTPScreen(
                    reqId: state.reqId,
                    phoneNumber: phoneController.text,
                  ),
                ),
              );
            } else if (state is LoginError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            return Column(
              children: [
                PhoneInputField(controller: phoneController),
                const SizedBox(height: 20),
                LoginActionButton(
                  state: state,
                  onPressed: () {
                    final phone = phoneController.text.trim();
                    context.read<LoginBloc>().add(SendOtpEvent(phone));
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
