import 'dart:convert';

ApiModel apiModelFromJson(String str) => ApiModel.fromJson(json.decode(str));

class ApiModel {
  ApiModel({
    required this.count,
    required this.results,
  });

  int count;
  List<Result> results;

  factory ApiModel.fromJson(Map<String, dynamic> json) => ApiModel(
        count: json["count"] ?? 0,
        results: json["results"] == null
            ? <Result>[]
            : List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );
}

class Result {
  Result({
    required this.id,
    required this.name,
    required this.price,
    required this.discountPrice,
    required this.images,
  });

  int id;
  String name;
  int price;
  int discountPrice;
  Images images;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        price: json["price"] ?? 0,
        discountPrice: json["discount_price"] ?? 0,
        images: Images.fromJson(json["images"] ?? ""),
      );
}

class Images {
  Images({
    required this.id,
    required this.image,
    required this.product,
  });

  int id;
  String image;
  int product;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        id: json["id"] ?? 0,
        image: json["image"] ?? "",
        product: json["product"] ?? 0,
      );
}
