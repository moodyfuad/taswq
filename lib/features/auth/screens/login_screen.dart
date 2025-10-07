import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:lottie/lottie.dart';
import 'package:taswq/features/auth/controllers/login_page_controller.dart';
import 'package:taswq/localization/string_keys.dart';
import 'package:taswq/routes/app_routes.dart';
import 'package:taswq/shared/widgets/neuro_button.dart';
import 'package:taswq/shared/widgets/primary_button.dart';
import 'package:taswq/shared/widgets/secondary_button.dart';
import 'package:taswq/utils/constants/asset_images.dart';
import 'package:taswq/utils/constants/asset_lotties.dart';
import 'package:taswq/utils/constants/colors.dart';
import 'package:taswq/utils/validators/validators.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final LoginPageController _pageController = Get.find<LoginPageController>();

  @override
  Widget build(BuildContext context) {
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
                          Form(
                            key: _pageController.formfieldKey,
                            autovalidateMode: AutovalidateMode.onUnfocus,

                            child: TextFormField(
                              validator: XValidators.phoneNumber,
                              keyboardType: TextInputType.numberWithOptions(),
                              onFieldSubmitted: (value) =>
                                  _pageController.formfieldKey,
                              controller: _pageController.phoneNumberController,

                              decoration: InputDecoration(
                                labelText: XStringKeys.phoneNumber.tr,
                                prefixIcon: Icon(IconsaxPlusLinear.mobile),
                              ),
                              onEditingComplete: _pageController.login,
                            ),
                          ),
                          SizedBox(height: 12),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            textDirection: TextDirection.rtl,
                            children: [
                              XPrimaryButton(
                                label: XStringKeys.login.tr,
                                onPressed: _pageController.login,
                              ),
                              SizedBox(width: 12),
                              XSecondaryButton(
                                label: XStringKeys.signup.tr,
                                onPressed: () {
                                  // _pageController._loginService.getPerson().then(
                                  //   (r) => Get.defaultDialog(
                                  //     title: 'شخص',
                                  //     titleStyle: Get.textTheme.titleLarge,
                                  //     middleText:
                                  //         'username:${r.username}\npassword:${r.password}',
                                  //   ),
                                  // );
                                },
                              ),
                            ],
                          ),
                          Spacer(),

                          SizedBox(height: 20),
                          Text('login with', style: Get.textTheme.bodyLarge),
                          SizedBox(height: 10),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
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
                          SizedBox(height: 100),
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
