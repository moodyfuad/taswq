import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:taswq/features/auth/bindings/login_page_binding.dart';
import 'package:taswq/features/auth/screens/login_screen.dart';
import 'package:taswq/routes/app_routes.dart';

class XAppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: XAppRoutes.login,
      page: (() => const LoginScreen()),
      binding: LoginPageBinding(),
      popGesture: false,
    ),
  ];
}
