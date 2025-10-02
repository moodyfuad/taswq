import 'dart:convert';

class Person {
    final String username;
    final String password;

    Person({
        required this.username,
        required this.password,
    });

    factory Person.fromRawJson(String str) => Person.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Person.fromJson(Map<String, dynamic> json) => Person(
        username: json["username"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
    };
}
