import 'package:flutter/cupertino.dart';

class ShoppingJewelleryViewModel extends ChangeNotifier {

  List<Map<String,dynamic>> shoppingItems = [
    {
      "image": "assets/images/diamond_image.png",
      "title": "TIFFANY AND CO.",
      "subTitle": "Floral Rise Necklace",
      "subTitle2": "\$720",
    },
    {
      "image": "assets/images/girl_necklace.png",
      "title": "TIFFANY AND CO.",
      "subTitle": "Floral Rise Necklace",
      "subTitle2": "\$920",
    },
    {
      "image": "assets/images/white_necklace.png",
      "title": "TIFFANY AND CO.",
      "subTitle": "Floral Rise Necklace",
      "subTitle2": "\$220",
    },
    {
      "image": "assets/images/diamond.png",
      "title": "TIFFANY AND CO.",
      "subTitle": "Floral Rise Necklace",
      "subTitle2": "\$110",
    }
  ];


  String dropdownValue = 'One';

  refreshUI() {
    notifyListeners();
  }

  init() {}

}