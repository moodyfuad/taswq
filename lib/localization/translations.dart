import 'package:get/get.dart';
import 'package:taswq/localization/string_keys.dart';

class XTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en': {
      'hello': 'Hello!',
      XStringKeys.welcome: 'Welcome!',
      XStringKeys.getStarted: 'Get Started',
      XStringKeys.login: 'Login',
      XStringKeys.signup: 'Sign Up',
      XStringKeys.email: 'Email',
      XStringKeys.password: 'Password',
      XStringKeys.confirmPassword: 'Confirm Password',
      XStringKeys.forgotPassword: 'Forgot Password?',
      XStringKeys.resetPassword: 'Reset Password',
      XStringKeys.sendResetLink: 'Send Reset Link',
      XStringKeys.home: 'Home',
      XStringKeys.profile: 'Profile',
      XStringKeys.settings: 'Settings',
      XStringKeys.logout: 'Logout',
      XStringKeys.language: 'Language',
      XStringKeys.phoneNumber: 'Phone Number',
      XStringKeys.appName: 'Taswq',
    },
    'ar': {
      XStringKeys.welcome: 'مرحبا!',
      XStringKeys.getStarted: 'ابدأ',
      XStringKeys.login: ' تسجيل الدخول',
      XStringKeys.signup: 'إنشاء حساب',
      XStringKeys.email: 'البريد الإلكتروني',
      XStringKeys.password: 'كلمة المرور',
      XStringKeys.confirmPassword: 'تأكيد كلمة المرور',
      XStringKeys.forgotPassword: 'هل نسيت كلمة المرور؟',
      XStringKeys.resetPassword: 'هل نسيت كلمة المرور؟',
      XStringKeys.sendResetLink: 'إعادة تعيين كلمة المرور',
      XStringKeys.home: 'الصفحة الرئيسية',
      XStringKeys.profile: 'الملف الشخصي',
      XStringKeys.settings: 'الاعدادات',
      XStringKeys.logout: 'تسجيل الخروج',
      XStringKeys.phoneNumber: 'رقم الهاتف',
      XStringKeys.appName: 'تسوق',
    },
  };
}
