import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sendotp_flutter_sdk/sendotp_flutter_sdk.dart';

part 'otp_event.dart';
part 'otp_state.dart';

class OTPBloc extends Bloc<OTPEvent, OTPState> {
  OTPBloc() : super(OTPInitial()) {
    on<VerifyOTPEvent>(_verifyOTP);
    on<ResendOTPEvent>(_resentOTP);
  }
  Future<void> _verifyOTP(VerifyOTPEvent event, Emitter<OTPState> emit) async {
    emit(OTPLoading());
    final response = await OTPWidget.verifyOTP({
      "reqId": event.reqId,
      "otp": event.otp,
    });

    if (response != null && response["type"] == "success") {
      emit(OTPVerified());
    } else {
      emit(OTPError("Invalid OTP"));
    }
  }

  Future<void> _resentOTP(ResendOTPEvent event, Emitter<OTPState> emit) async {
    final response = await OTPWidget.retryOTP({
      "reqId": event.reqId,
      // "retryChannel": 11,
    });

    if (response != null && response["type"] == "success") {
      emit(OTPResent());
    } else {
      emit(OTPError("Failed to resend OTP"));
    }
  }
}
