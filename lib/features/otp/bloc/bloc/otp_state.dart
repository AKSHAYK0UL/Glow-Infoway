part of 'otp_bloc.dart';

sealed class OTPState {}

final class OTPInitial extends OTPState {}

class OTPLoading extends OTPState {}

class OTPVerified extends OTPState {}

class OTPError extends OTPState {
  final String message;
  OTPError(this.message);
}

class OTPResent extends OTPState {}
