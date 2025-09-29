import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:taswq/features/auth/screens/onboarding.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      getPages: [],
      
      theme: ThemeData(),
      
      home: const Onboarding(),
    );
  }
}
