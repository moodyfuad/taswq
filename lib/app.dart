import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:taswq/features/auth/screens/login_screen.dart';
import 'package:taswq/features/auth/screens/onboarding.dart';
import 'package:taswq/localization/translations.dart';
import 'package:taswq/routes/app_pages.dart';
import 'package:taswq/routes/app_routes.dart';
import 'package:taswq/utils/themes/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
