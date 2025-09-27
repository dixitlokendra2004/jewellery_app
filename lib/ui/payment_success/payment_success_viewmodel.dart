import 'package:flutter/cupertino.dart';

class PaymentSuccessViewModel extends ChangeNotifier {


  int itemCount = 0;
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