import 'package:flutter/cupertino.dart';

class LastCheckoutPageViewModel extends ChangeNotifier {

  final List<Map<String, dynamic>> cartContainer = [
    {
      'image': "assets/images/diamond_image.png",
      'brand': "F O R E V E R M A R K",
      'product': "Silver Layerd Drop Necklace",
      'price': "\$120"
    },
    {
      'image': "assets/images/lock_key_image.png",
      'brand': "F O R E V E R M A R K",
      'product': "Silver Layerd Drop Necklace",
      'price': "\$120"
    },
  ];

  int itemCount = 0;
  String dropdownValue = 'One';
  bool isFavorited = false;

  void incrementItem() {
      itemCount++;
      notifyListeners();
  }

  void decrementItem() {
      if (itemCount > 0) {
        itemCount--;
      }
      notifyListeners();

  }




  toggleFavorite() {
    isFavorited = !isFavorited;
    notifyListeners();
  }

  refreshUI() {
    notifyListeners();
  }

  init() {}

}