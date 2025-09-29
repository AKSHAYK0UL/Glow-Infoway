part of 'login_bloc.dart';

sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class OtpSentState extends LoginState {
  final String reqId;
  OtpSentState(this.reqId);
}

final class LoginError extends LoginState {
  final String message;
  LoginError(this.message);
}
