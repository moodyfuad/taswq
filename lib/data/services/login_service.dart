import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:taswq/features/auth/models/login_result.dart';
import 'package:taswq/features/auth/models/person.dart';

class LoginService {
  static const String baseUrl = 'http://taswq.runasp.net/';
  Future<Person> getPerson() async {
    try {
      final response = await http.get(Uri.parse(baseUrl + 'person'));
      if (response.statusCode == 200) {}
      return Person.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw e;
    }
  }

  Future<LoginResult> login(Person person) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl + 'person/login'),
        headers: {
          'accept': 'application/json',
          'Content-Type': 'application/json',
        },
        encoding: Utf8Codec(),
        body: person.toRawJson(),
      );
      if (response.statusCode == 200) {}
      return LoginResult.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw e;
    }
  }
}
