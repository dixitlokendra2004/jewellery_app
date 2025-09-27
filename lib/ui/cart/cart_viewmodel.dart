import 'package:flutter/cupertino.dart';

class CartPageViewModel extends ChangeNotifier {

  List<Map<String,dynamic>> shoppingItems = [
    {
      "image": "assets/images/diamond.png",
      "title": "GIVA",
      "subTitle": "silver layered drop necklace",
      "subTitle2": "\$500.5",
    },
    {
      "image": "assets/images/lock_key_image.png",
      "title": "FOREVERMARK",
      "subTitle": "Locke and Key",
      "subTitle2": "\$910",
    }
  ];

  String dropdownValue = 'One';
  int counter = 0;
  bool isSubtotalExpanded = false;

  incrementCount() {
    counter++;
    notifyListeners();
  }

  decrementCount() {
      if (counter > 0) counter--;
      notifyListeners();
  }

  subTotal() {
    isSubtotalExpanded = !isSubtotalExpanded;
    notifyListeners();

  }

  refreshUI() {
    notifyListeners();
  }

  init() {}

}