import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msg_91/secrets.dart';
import 'package:sendotp_flutter_sdk/sendotp_flutter_sdk.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final String widgetId = WIDGET_ID;
  final String authToken = AUTH_TOKEN;
  LoginBloc() : super(LoginInitial()) {
    OTPWidget.initializeWidget(widgetId, authToken);

    on<SendOtpEvent>((event, emit) async {
      emit(LoginLoading());
      final response = await OTPWidget.sendOTP({
        "identifier": event.phoneNumber,
      });

      if (response != null && response["type"] == "success") {
        emit(OtpSentState(response["message"]));
      } else {
        emit(LoginError("Failed to send OTP"));
      }
    });
  }
}
