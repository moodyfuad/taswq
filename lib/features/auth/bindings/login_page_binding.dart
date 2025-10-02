import 'package:get/get.dart';
import 'package:taswq/features/auth/controllers/login_page_controller.dart';

class LoginPageBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(LoginPageController());
  }
}
