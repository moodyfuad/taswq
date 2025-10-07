import 'package:taswq/data/services/api_services.dart';
import 'package:taswq/features/auth/models/login_result.dart';
import 'package:taswq/features/auth/models/person.dart';

class LoginService {
  Future<Person> getPerson() async {
    return await XApiServices.getRequest('person', fromJson: Person.fromJson);
  }

  Future<LoginResult> login(Person person) async {
    return await XApiServices.postRequest(
      'person/login',
      body: person.toJson(),
      fromJson: LoginResult.fromJson,
    );
  }

  Future<LoginResult> newLogin(String phone) async {
    return await XApiServices.postFormRequest(
      'login',
      body: {'phone': phone},
      fromJson: LoginResult.fromJson,
    );
  }

  Future<LoginResult> loginCodeConfirmation(String code) async {
    return await XApiServices.postFormRequest(
      'Login/CodeConfirmation',
      body: {'code': code},
      fromJson: LoginResult.fromJson,
    );
  }
}
