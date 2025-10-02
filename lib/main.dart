// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';
import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/instance_manager.dart';
import 'package:get/utils.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:omni_video_player/omni_video_player/controllers/global_playback_controller.dart';
import 'package:taswq/features/auth/screens/login_screen.dart';
import 'package:taswq/localization/string_keys.dart';
import 'package:taswq/localization/translations.dart';
import 'package:taswq/routes/app_pages.dart';
import 'package:taswq/routes/app_routes.dart';

import 'package:taswq/shared/widgets/animated_badge.dart';
import 'package:taswq/shared/widgets/animated_button.dart';
import 'package:taswq/shared/widgets/animated_fill_button.dart';
import 'package:taswq/shared/widgets/card.dart';
import 'package:taswq/shared/widgets/glass_container.dart';
import 'package:taswq/shared/widgets/neuro_button.dart';
import 'package:taswq/shared/widgets/primary_button.dart';
import 'package:taswq/shared/widgets/secondary_button.dart';
import 'package:taswq/utils/constants/colors.dart';
import 'package:taswq/utils/constants/sizes.dart';
import 'package:taswq/utils/themes/app_theme.dart';
import 'package:taswq/utils/themes/appbar_theme.dart';

void main() {
  Get.create<GlobalPlaybackController>(() => GlobalPlaybackController());
  runApp(const LumenApp());
}

class LumenApp extends StatelessWidget {
  const LumenApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      maintainBottomViewPadding: true,
      child: GetMaterialApp(
        title: 'LumenWave (Light) Demo',
        theme: XAppTheme.light,
        // home: const HomePage(),
        // home: const LoginScreen(),
        // home: LiquidButtonDemo(),
        locale: Locale('ar'),
        translations: XTranslations(),
        getPages: XAppPages.pages,
        initialRoute: XAppRoutes.login,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool success = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('الثيم الفاتح'),
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(XSizes.screenPadding),
        child: Stack(
          children: [
            // Image.asset(
            //   'assets/images/bg.png',
            //   fit: BoxFit.fill,
            //   height: size.height,
            // ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('اهلا و سهلا بكم', style: theme.textTheme.titleLarge),
                const SizedBox(height: 12),
                XCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('عنوان البطاقة', style: theme.textTheme.titleMedium),
                      const SizedBox(height: 8),
                      Text(
                        'وصف قصير بس ع شان نشوف الثيم الزجاجي على اساس يعني',
                        style: theme.textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          XPrimaryButton(
                            label: 'الزر الرئيسي',
                            onPressed: () {},
                            // leading: Icon(IconsaxPlusLinear.add_square),
                          ),
                          const SizedBox(width: 12),
                          XSecondaryButton(
                            label: 'الزر الثانوي',
                            onPressed: () {},
                          ),
                          const SizedBox(width: 12),
                          XNeuroButton(
                            color: XColors.electricMagenta,
                            child: Text(
                              'اضغطني',
                              style: theme.textTheme.bodyLarge!.copyWith(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
                Center(
                  child: XGlassContainer(
                    blur: 1.2,
                    opacity: 0.3,
                    bgColor: XColors.electricMagenta,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            IconsaxPlusBold.add_circle,
                            color: XColors.onPrimaryText,
                          ),
                          Text(
                            'ثيم زجاجي',
                            style: theme.textTheme.titleSmall!.copyWith(
                              color: XColors.onPrimaryText,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                Center(
                  child: XNeuroButton(
                    color: XColors.electricMagenta,
                    child: Text(
                      XStringKeys.language.tr,

                      style: theme.textTheme.titleSmall!.copyWith(),
                    ),
                    onPressed: () async => await Get.updateLocale(
                      Get.locale == const Locale('en')
                          ? const Locale('ar')
                          : const Locale('en'),
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                Text('زر التطبيق المميز', style: theme.textTheme.titleLarge),
                const SizedBox(height: 12),
                Center(
                  child: XAnimatedButton(
                    width: min(size.width * 0.9, 420),
                    label: 'Do the Wave',
                    onTap: () {
                      setState(() {
                        success = !success;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 18),
                Center(
                  child: XAnimatedBadge(
                    success: success,
                    label: success ? 'Success' : 'Tap to start',
                  ),
                ),
                const SizedBox(height: 26),
                Text('Sample Cards', style: theme.textTheme.titleLarge),
                const SizedBox(height: 12),
                XCard(
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: XColors.lavenderMist,
                        child: Icon(
                          IconsaxPlusLinear.home_hashtag,
                          color: XColors.lumenIndigo,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'متجر محلي',
                              style: theme.textTheme.titleSmall,
                            ),
                            const SizedBox(height: 6),
                            Text(
                              'Open now • 1.2 km',
                              style: theme.textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Icon(IconsaxPlusLinear.arrow_left_1),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Icon(IconsaxPlusLinear.message_notif, size: 14), //xs
                    Icon(IconsaxPlusLinear.message_notif, size: 16), //s
                    Icon(IconsaxPlusLinear.message_notif, size: 20), //m
                    Icon(IconsaxPlusLinear.message_notif, size: 24), //l
                    Icon(IconsaxPlusLinear.message_notif, size: 27), //xl
                    Icon(IconsaxPlusLinear.message_notif, size: 30), //xxl
                  ],
                ),
                Text('عرض كبير', style: theme.textTheme.displayLarge),
                Text('عرض متوسط', style: theme.textTheme.displayMedium),
                Text('عرض صغير', style: theme.textTheme.displaySmall),
                Divider(),
                Text('عنوان رئيسي كبير', style: theme.textTheme.headlineLarge),
                Text(
                  'عنوان رئيسي متوسط',
                  style: theme.textTheme.headlineMedium,
                ),
                Text('عنوان رئيسي صغير', style: theme.textTheme.headlineSmall),
                Divider(),
                Text('عنوان  كبير', style: theme.textTheme.titleLarge),
                Text('عنوان  متوسط', style: theme.textTheme.titleMedium),
                Text('عنوان  صغير', style: theme.textTheme.titleSmall),

                const SizedBox(height: 60),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
