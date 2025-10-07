import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taswq/data/services/login_service.dart';
import 'package:taswq/features/auth/models/login_result.dart';
import 'package:taswq/features/auth/models/person.dart';
import 'package:taswq/routes/app_routes.dart';

class LoginPageController extends GetxController {
  final phoneNumberController = TextEditingController();
  bool visible = false;
  final _loginService = LoginService();
  final formfieldKey = GlobalKey<FormState>();
  void login() async {
    if (formfieldKey.currentState!.validate()) {
      final result = await _loginRequest();
      if (result.success) {
        Get.toNamed(XAppRoutes.otp);
      } else {
        Get.defaultDialog(
          titleStyle: Get.textTheme.titleLarge,
          title: 'خطأ',
          middleText: result.message,
        );
      }
    }
  }

  Future<LoginResult> _loginRequest() async {
    showLoadingDialog();
    final result = await _loginService.newLogin(phoneNumberController.text);
    //   Person(
    //     username: usernameController.text,
    //     password: passwordController.text,
    //   ),
    // );
    showLoadingDialog();
    //todo: navigate to number confirmation page
    //todo: save login credentials & token at local
    return result;
  }

  showLoadingDialog() {
    (!visible)
        ? Get.defaultDialog(
            title: 'تسجيل الدخول',
            titleStyle: Get.textTheme.titleLarge,
            actions: null,
            middleText: '',
            content: CircularProgressIndicator.adaptive(),
          )
        : Get.back();
    visible = !visible;
  }
}
