import 'package:flutter/cupertino.dart';

class ShoppingItemsViewModel extends ChangeNotifier {

  List<Map<String,dynamic>> shoppingItems = [
    {
      "image": "assets/images/diamond_image.png",
      "title": "TIFFANY AND CO.",
      "subTitle": "Floral Rise Necklace",
      "subTitle2": "\$720",
      "rating": "4.8 Ratings"
    },
    {
      "image": "assets/images/girl_necklace.png",
      "title": "TIFFANY AND CO.",
      "subTitle": "Floral Rise Necklace",
      "subTitle2": "\$920",
      "rating": "4.8 Ratings"
    },
    {
      "image": "assets/images/white_necklace.png",
      "title": "TIFFANY AND CO.",
      "subTitle": "Floral Rise Necklace",
      "subTitle2": "\$220",
      "rating": "4.8 Ratings"
    },
    {
      "image": "assets/images/diamond.png",
      "title": "TIFFANY AND CO.",
      "subTitle": "Floral Rise Necklace",
      "subTitle2": "\$110",
      "rating": "4.8 Ratings"
    }
  ];

  String dropdownValue = 'One';
  bool isFavorited = false;

   toggleFavorite() {
      isFavorited = !isFavorited;
      notifyListeners();
  }

  refreshUI() {
    notifyListeners();
  }

  init() {}

}