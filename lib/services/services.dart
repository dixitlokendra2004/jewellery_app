import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:jewellery_app/constants.dart';
import 'package:jewellery_app/model/get_categories_model.dart';

import '../model/image_model.dart';
class Services {

  static  Future<List<AllImages>> getAllImages() async {
    try {
      final response = await http.get(Uri.parse('https://silicon-technologies.co.in/jewellery/get_all_promo.php'));

      if (response.statusCode == 200) {
        //final data = json.decode(response.body);
        print(response.body);
        List<AllImages> images = allImagesFromJson(response.body);
        return images;
      } else {
        throw Exception('Failed to load promo images');
      }
    } catch(error) {
      print(error);
      return[];
    }
  }

  static  Future<List<AllCategories>> getAllCategories() async {
    try {
      final response = await http.get(Uri.parse(BASE_URL+'/get_categories.php'));

      if (response.statusCode == 200) {
        //final data = json.decode(response.body);
        print(response.body);
        List<AllCategories> images = allCategoriesFromJson(response.body);
        print("completed");
        return images;
      } else {
        throw Exception('Failed to load Categories');
      }
    } catch(error) {
      print(error);
      return[];
    }
  }


}