import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class XApiServices {
  static const String baseUrl = 'http://taswq.runasp.net/';

  static Future<T> getRequest<T>(
    String route, {
    required T Function(Map<String, dynamic> map) fromJson,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await http.get(
        Uri.parse("${baseUrl}$route"),
        headers: headers,
      );
      final decodedJson = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return fromJson(decodedJson);
      } else {
        throw Exception(
          "Failed At Fetching data with Status Code [${response.statusCode}]",
        );
      }
    } catch (e) {
      rethrow;
    }
  }

  static FutureOr<T> postRequest<T>(
    String route, {
    required Map<String, String> body,
    required T Function(Map<String, dynamic> map) fromJson,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl$route'),
        headers:
            headers ??
            {'accept': 'application/json', 'Content-Type': 'application/json'},

        encoding: Utf8Codec(),
        body: jsonEncode(body),
      );
      print(response.body);
      if (response.statusCode <= 200 && response.statusCode < 300) {
        return fromJson(jsonDecode(response.body));
      } else {
        throw Exception(
          "Failed At Fetching data with Status Code [${response.statusCode}]",
        );
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  static Future<T> postFormRequest<T>(
    String route, {
    required Map<String, String> body,
    required T Function(Map<String, dynamic> map) fromJson,
    Map<String, String>? headers,
  }) async {
    return await postRequest(
      route,
      body: body,
      fromJson: fromJson,
      
      headers: {
        'accept': '*/*',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
    );
  }
}
