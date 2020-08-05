import 'dart:convert';

List<Laptops> laptopsFromJson(String str) => List<Laptops>.from(json.decode(str).map((x) => Laptops.fromJson(x)));

String laptopsToJson(List<Laptops> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Laptops {
    int id;
    String name;
    String picture;
    int price;
    int oldprice;

    Laptops({
        this.id,
        this.name,
        this.picture,
        this.price,
        this.oldprice,
    });

    factory Laptops.fromJson(Map<String, dynamic> json) => Laptops(
        id: json["id"],
        name: json["name"],
        picture: json["picture"],
        price: json["price"],
        oldprice: json["oldprice"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "picture": picture,
        "price": price,
        "oldprice": oldprice,
    };
}