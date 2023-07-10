// To parse this JSON data, do
//
//     final getSelllerModel = getSelllerModelFromJson(jsonString);

import 'dart:convert';

GetSellerModel getSelllerModelFromJson(String str) => GetSellerModel.fromJson(json.decode(str));

String getSelllerModelToJson(GetSellerModel data) => json.encode(data.toJson());

class GetSellerModel {
  bool error;
  String message;
  String total;
  List<SellerData> data;

  GetSellerModel({
    required this.error,
    required this.message,
    required this.total,
    required this.data,
  });

  factory GetSellerModel.fromJson(Map<String, dynamic> json) => GetSellerModel(
    error: json["error"],
    message: json["message"],
    total: json["total"],
    data: List<SellerData>.from(json["data"].map((x) => SellerData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
    "total": total,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class SellerData {
  String sellerId;
  String sellerName;
  String email;
  String mobile;
  String slug;
  String sellerRating;
  String noOfRatings;
  String storeName;
  String storeUrl;
  String storeDescription;
  String sellerProfile;
  String balance;
  String totalProducts;

  SellerData({
    required this.sellerId,
    required this.sellerName,
    required this.email,
    required this.mobile,
    required this.slug,
    required this.sellerRating,
    required this.noOfRatings,
    required this.storeName,
    required this.storeUrl,
    required this.storeDescription,
    required this.sellerProfile,
    required this.balance,
    required this.totalProducts,
  });

  factory SellerData.fromJson(Map<String, dynamic> json) => SellerData(
    sellerId: json["seller_id"],
    sellerName: json["seller_name"],
    email: json["email"],
    mobile: json["mobile"],
    slug: json["slug"],
    sellerRating: json["seller_rating"],
    noOfRatings: json["no_of_ratings"],
    storeName: json["store_name"],
    storeUrl: json["store_url"],
    storeDescription: json["store_description"],
    sellerProfile: json["seller_profile"],
    balance: json["balance"],
    totalProducts: json["total_products"],
  );

  Map<String, dynamic> toJson() => {
    "seller_id": sellerId,
    "seller_name": sellerName,
    "email": email,
    "mobile": mobile,
    "slug": slug,
    "seller_rating": sellerRating,
    "no_of_ratings": noOfRatings,
    "store_name": storeName,
    "store_url": storeUrl,
    "store_description": storeDescription,
    "seller_profile": sellerProfile,
    "balance": balance,
    "total_products": totalProducts,
  };
}
