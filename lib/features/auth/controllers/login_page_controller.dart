import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taswq/data/services/login_service.dart';
import 'package:taswq/features/auth/models/login_result.dart';
import 'package:taswq/features/auth/models/person.dart';

class LoginPageController extends GetxController {
  final obscure = false.obs;
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool visible = false;
  final loginService = LoginService();
  void hidePassword() {
    obscure.value = !obscure.value;
  }

  Future<LoginResult> login() async {
    showLoadingDialog();
    final result = await loginService.login(
      Person(
        username: usernameController.text,
        password: passwordController.text,
      ),
    );
    showLoadingDialog();
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

  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();
  }
}
