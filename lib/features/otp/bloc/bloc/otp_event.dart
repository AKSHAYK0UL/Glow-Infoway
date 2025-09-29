part of 'otp_bloc.dart';

sealed class OTPEvent {}

final class VerifyOTPEvent extends OTPEvent {
  final String reqId;
  final String otp;
  VerifyOTPEvent(this.reqId, this.otp);
}

final class ResendOTPEvent extends OTPEvent {
  final String reqId;
  ResendOTPEvent(this.reqId);
}
