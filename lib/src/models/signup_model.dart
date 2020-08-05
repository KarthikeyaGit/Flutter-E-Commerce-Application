import 'dart:convert';

Usermodel usermodelFromJson(String str) => Usermodel.fromJson(json.decode(str));

String usermodelToJson(Usermodel data) => json.encode(data.toJson());

class Usermodel {
    int id;
    String username;
    String password;
    String email;

    Usermodel({
        this.id,
        this.username,
        this.password,
        this.email,
    });

    factory Usermodel.fromJson(Map<String, dynamic> json) => Usermodel(
        id: json["id"],
        username: json["username"],
        password: json["password"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "password": password,
        "email": email,
    };
}
