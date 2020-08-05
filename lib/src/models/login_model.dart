import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
    int id;
    String username;
    String password;
    String email;


    Login({
        this.id,
        this.username,
        this.password,
        this.email,
    });

    factory Login.fromJson(Map<String, dynamic> json) => Login(
        id: json["id"],
        username: json["username"]as String,
        password: json["password"]as String,
        email: json["email"]as String,
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "password": password,
        "email": email,
    };

  bool success = true;
}