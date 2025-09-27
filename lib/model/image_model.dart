// To parse this JSON data, do
//
//     final allImages = allImagesFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<AllImages> allImagesFromJson(String str) => List<AllImages>.from(json.decode(str).map((x) => AllImages.fromJson(x)));

String allImagesToJson(List<AllImages> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllImages {
  final String id;
  final String image_name;
  final String active;

  AllImages({
    required this.id,
    required this.image_name,
    required this.active,
  });

  AllImages copyWith({
    String? id,
    String? imageName,
    String? active,
  }) =>
      AllImages(
        id: id ?? this.id,
        image_name: imageName ?? this.image_name,
        active: active ?? this.active,
      );

  factory AllImages.fromJson(Map<String, dynamic> json) => AllImages(
    id: json["id"],
    image_name: json["image_name"],
    active: json["active"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image_name": image_name,
    "active": active,
  };
}
