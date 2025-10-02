import 'dart:convert';

class LoginResult {
    final bool success;
    final String message;

    LoginResult({
        required this.success,
        required this.message,
    });

    factory LoginResult.fromRawJson(String str) => LoginResult.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory LoginResult.fromJson(Map<String, dynamic> json) => LoginResult(
        success: json["success"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
    };
}
