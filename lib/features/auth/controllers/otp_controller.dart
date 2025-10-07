import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:taswq/data/services/login_service.dart';
import 'package:taswq/routes/app_routes.dart';

class OtpController extends GetxController {
  final codeController = TextEditingController();
  final _loginService = LoginService();
  final RxInt remainingSeconds = 300.obs; // 5 minutes
  final RxBool canResend = false.obs;
  Timer? _timer;

  @override
  void onInit() {
    startTimer();
    codeController.addListener(() async {
      if (codeController.text.length == 4) {
        await verifyCode();
      }
    });
    super.onInit();
  }

  void startTimer() {
    remainingSeconds.value = 300;
    canResend.value = false;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds.value > 0) {
        remainingSeconds.value--;
      } else {
        canResend.value = true;
        timer.cancel();
      }
    });
  }

  void resendCode() {
    // TODO: Add logic to resend the code via API
    startTimer();
  }

  Future<void> verifyCode() async {
    if (codeController.text.length == 4) {
      // TODO: Add API verification logic
      final result = await _loginService.loginCodeConfirmation(
        codeController.text,
      );
      print(codeController.text);

      await Future.delayed(Duration(milliseconds: 100), () {
        if (result.success == true) {
          Get.snackbar('Success', 'Code verified successfully');
        } else {
          Get.snackbar('Error', 'Please enter the 4-digit code 1');
        }
      });
    } else {
      Get.snackbar('Error', 'Please enter the 4-digit code 2');
    }

    Get.offAllNamed(XAppRoutes.home);
  }

  String get formattedTime {
    final minutes = remainingSeconds.value ~/ 60;
    final seconds = remainingSeconds.value % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
