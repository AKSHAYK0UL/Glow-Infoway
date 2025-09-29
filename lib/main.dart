import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msg_91/features/login/bloc/bloc/login_bloc.dart';
import 'package:msg_91/features/login/presentation/screens/login_screen.dart';
import 'package:msg_91/features/otp/bloc/bloc/otp_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginBloc()),
        BlocProvider(create: (context) => OTPBloc()),
      ],

      child: MaterialApp(
        title: 'MSG91 OTP Auth',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
