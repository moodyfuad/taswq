import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:taswq/features/auth/screens/onboarding.dart';
import 'package:taswq/localization/translations.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return GetMaterialApp(
      title: 'Flutter Demo',
      getPages: [],
      translations: XTranslations(),
      locale: const Locale('en'),

      theme: ThemeData(),

      home: const Onboarding(),
    );
  }
}
