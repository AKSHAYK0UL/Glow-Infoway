part of 'login_bloc.dart';

sealed class LoginEvent {}

final class SendOtpEvent extends LoginEvent {
  final String phoneNumber;
  SendOtpEvent(this.phoneNumber);
}
