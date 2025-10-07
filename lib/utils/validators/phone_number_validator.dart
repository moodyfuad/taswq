part of 'validators.dart';

String? _phoneNumber(String? phoneNumber) {
  if (phoneNumber == null) {
    return 'الرجاء ادخال رقم الجوال';
  } else if (phoneNumber.length != 9) {
    return 'عدد ارقام الجوال يجب ان تكون 9';
  } else if (![
    '77',
    '73',
    '78',
    '71',
    '70',
  ].contains(phoneNumber.substring(0, 2))) {
    return 'يجب ان يبدأ الرقم بـ77 أو 78 أو 73 أو 71 أو 70';
  }
  return null;
}
