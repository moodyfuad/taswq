import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:taswq/features/auth/controllers/otp_controller.dart';

class XOtpScreen extends StatelessWidget {
  final OtpController controller = Get.put(OtpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("رقم التحقق", style: Get.textTheme.titleLarge),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "ادخل الرقم المكون من 4 ارقام المرسل اليك",
              textAlign: TextAlign.center,
              style: Get.textTheme.titleMedium!.copyWith(),
            ),
            const SizedBox(height: 30),

            // Pinput for OTP input
            Directionality(
              textDirection: TextDirection.ltr,
              child: Pinput(
                controller: controller.codeController,

                length: 4,

                autofocus: true,
                showCursor: true,

                defaultPinTheme: PinTheme(
                  width: 50,
                  height: 60,
                  textStyle: Get.textTheme.titleMedium!.copyWith(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade400),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Countdown timer
            Obx(
              () => Text(
                "الوقت المتبقي ${controller.formattedTime}",
                style: const TextStyle(fontSize: 16, color: Colors.black54),
              ),
            ),

            const SizedBox(height: 20),

            // Resend button
            Obx(
              () => TextButton(
                onPressed: controller.canResend.value
                    ? controller.resendCode
                    : null,
                child: Text(
                  controller.canResend.value
                      ? "اعادة الارسال"
                      : "امكانية اعادة الارسال بعد ${controller.formattedTime}",
                  style: Get.textTheme.bodyMedium!.copyWith(
                    color: controller.canResend.value
                        ? Colors.blue
                        : Colors.grey,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40),

            // Verify button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: controller.verifyCode,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text("Verify", style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
