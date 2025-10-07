import 'package:get/get.dart';
import 'package:taswq/features/auth/bindings/login_page_binding.dart';
import 'package:taswq/features/auth/screens/login_screen.dart';
import 'package:taswq/features/auth/screens/otp_screen.dart';
import 'package:taswq/features/product/bindings/home_bindings.dart';
import 'package:taswq/features/product/screens/home_screen.dart';
import 'package:taswq/routes/app_routes.dart';

class XAppPages {
  XAppPages._();
  static final List<GetPage> pages = [
    GetPage(
      name: XAppRoutes.login,
      page: (() => LoginScreen()),
      binding: LoginPageBinding(),
      popGesture: false,
    ),
    GetPage(name: XAppRoutes.otp, page: (() => XOtpScreen())),
    GetPage(
      name: XAppRoutes.home,
      page: (() => HomeScreen()),
      binding: HomeBinding(),
    ),
  ];
}
