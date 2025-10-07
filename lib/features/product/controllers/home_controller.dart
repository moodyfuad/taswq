// home_controller.dart
import 'package:get/get.dart';

class HomeController extends GetxController {
  // مؤقت لعرض Flash Sale مثلاً
  RxInt flashRemaining = 3600.obs; // ساعة

  @override
  void onInit() {
    super.onInit();
    _startFlashTimer();
  }

  void _startFlashTimer() {
    ever(flashRemaining, (val) {
      if (flashRemaining.value <= 0) {
        flashRemaining.value = 0;
      }
    });
    Future.delayed(const Duration(seconds: 1), () {
      if (flashRemaining.value > 0) {
        flashRemaining.value--;
        _startFlashTimer();
      }
    });
  }

  void onSearchTap() {
    // navigate to search page
  }

  void onCartTap() {
    // navigate to cart page
  }

  void onProductTap(/* product model */) {
    // navigate to product detail
  }
}
