// To parse this JSON data, do
//
//     final allCategories = allCategoriesFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<AllCategories> allCategoriesFromJson(String str) => List<AllCategories>.from(json.decode(str).map((x) => AllCategories.fromJson(x)));

String allCategoriesToJson(List<AllCategories> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllCategories {
  final String categoryId;
  final String categoryName;
  final List<Subcategory> subcategories;

  AllCategories({
    required this.categoryId,
    required this.categoryName,
    required this.subcategories,
  });

  AllCategories copyWith({
    String? categoryId,
    String? categoryName,
    List<Subcategory>? subcategories,
  }) =>
      AllCategories(
        categoryId: categoryId ?? this.categoryId,
        categoryName: categoryName ?? this.categoryName,
        subcategories: subcategories ?? this.subcategories,
      );

  factory AllCategories.fromJson(Map<String, dynamic> json) => AllCategories(
    categoryId: json["category_id"],
    categoryName: json["category_name"],
    subcategories: List<Subcategory>.from(json["subcategories"].map((x) => Subcategory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "category_id": categoryId,
    "category_name": categoryName,
    "subcategories": List<dynamic>.from(subcategories.map((x) => x.toJson())),
  };
}

class Subcategory {
  final String subcategoryId;
  final String subcategoryName;

  Subcategory({
    required this.subcategoryId,
    required this.subcategoryName,
  });

  Subcategory copyWith({
    String? subcategoryId,
    String? subcategoryName,
  }) =>
      Subcategory(
        subcategoryId: subcategoryId ?? this.subcategoryId,
        subcategoryName: subcategoryName ?? this.subcategoryName,
      );

  factory Subcategory.fromJson(Map<String, dynamic> json) => Subcategory(
    subcategoryId: json["subcategory_id"],
    subcategoryName: json["subcategory_name"],
  );

  Map<String, dynamic> toJson() => {
    "subcategory_id": subcategoryId,
    "subcategory_name": subcategoryName,
  };
}
