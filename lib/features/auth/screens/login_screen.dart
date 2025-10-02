import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:lottie/lottie.dart';
import 'package:taswq/features/auth/controllers/login_page_controller.dart';
import 'package:taswq/features/auth/screens/veedz_page.dart';
import 'package:taswq/localization/string_keys.dart';
import 'package:taswq/shared/widgets/neuro_button.dart';
import 'package:taswq/shared/widgets/primary_button.dart';
import 'package:taswq/shared/widgets/secondary_button.dart';
import 'package:taswq/utils/constants/asset_images.dart';
import 'package:taswq/utils/constants/asset_lotties.dart';
import 'package:taswq/utils/constants/colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginPageController _pageController = Get.find<LoginPageController>();
    return Scaffold(
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: Get.height),
          child: Stack(
            fit: StackFit.loose,
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 80,
                left: 20,
                child: XNeuroButton(
                  onPressed: () => Get.updateLocale(
                    Get.locale == const Locale('en')
                        ? const Locale('ar')
                        : const Locale('en'),
                  ),

                  child: Icon(IconsaxPlusBold.language_square, size: 30),
                ),
              ),
              // Image.asset(
              //   XAssetImages.logo,
              //   // height: Get.width * 2,
              //   // width: Get.width * 2,
              //   fit: BoxFit.fill,
              // ),
              Column(
                // mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          textAlign: TextAlign.right,
                          XStringKeys.welcome.tr,
                          style: Get.theme.textTheme.displayLarge!.copyWith(
                            fontSize: 50,
                          ),
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          XStringKeys.appName.tr,
                          style: Get.theme.textTheme.displayLarge!.copyWith(
                            fontSize: 150,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            controller: _pageController.usernameController,
                            decoration: InputDecoration(
                              labelText: XStringKeys.phoneNumber.tr,
                              prefixIcon: Icon(IconsaxPlusLinear.mobile),
                            ),
                          ),
                          SizedBox(height: 12),

                          Obx(
                            () => TextFormField(
                              controller: _pageController.passwordController,
                              obscureText: _pageController.obscure.value,
                              decoration: InputDecoration(
                                labelText: XStringKeys.password.tr,
                                prefixIcon: Icon(IconsaxPlusLinear.lock),
                                suffixIcon: IconButton(
                                  onPressed: _pageController.hidePassword,
                                  icon: Icon(
                                    _pageController.obscure.value
                                        ? IconsaxPlusLinear.eye_slash
                                        : IconsaxPlusLinear.eye,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            textDirection: TextDirection.rtl,
                            children: [
                              XPrimaryButton(
                                label: XStringKeys.login.tr,

                                // style: Get.theme.textTheme.titleLarge,
                                onPressed: () {
                                  _pageController.login().then(
                                    (r) => Get.defaultDialog(
                                      titleStyle: Get.textTheme.titleLarge,
                                      title: r.success
                                          ? 'تم تسجيل الدخول'
                                          : 'خطأ',
                                      middleText: r.message,
                                    ),
                                  );
                                },
                              ),
                              SizedBox(width: 12),
                              XSecondaryButton(
                                label: XStringKeys.signup.tr,
                                onPressed: () {
                                  _pageController.loginService.getPerson().then(
                                    (r) => Get.defaultDialog(
                                      title: 'شخص',
                                      titleStyle: Get.textTheme.titleLarge,
                                      middleText:
                                          'username:${r.username}\npassword:${r.password}',
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                          Spacer(),
                          XNeuroButton(
                            onPressed: ()=> Get.to(()=> VeedzPage()),
                            child: Text(
                              "Veedz",
                              style: Get.textTheme.titleLarge,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text('login with', style: Get.textTheme.bodyLarge),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundColor: XColors.primaryText,
                                radius: 25,
                                child: Lottie.asset(
                                  XAssetLotties.facebook_logo,
                                  height: 30,
                                ),
                              ),
                              SizedBox(width: 10),
                              CircleAvatar(
                                backgroundColor: XColors.primaryText,
                                radius: 25,
                                child: Lottie.asset(
                                  XAssetLotties.instagram_logo,
                                  height: 30,
                                ),
                              ),
                              SizedBox(width: 10),
                              CircleAvatar(
                                backgroundColor: XColors.primaryText,
                                radius: 25,
                                child: Lottie.asset(
                                  XAssetLotties.twitter_logo,
                                  height: 30,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 50),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
