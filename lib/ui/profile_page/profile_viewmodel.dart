import 'package:flutter/cupertino.dart';

class ProfileViewModel extends ChangeNotifier {

  final List<Map<String, dynamic>> profilarray = [
    {'imageicon': "assets/images/profile.png", 'name': "Profile Details"},
    {'imageicon': "assets/images/order.png", 'name': "Orders"},
    {'imageicon': "assets/images/order.png", 'name': "Payment Methods"},
    {'imageicon': "assets/images/Heart.png", 'name': "Favorites"},
    {'imageicon': "assets/images/callbig.png", 'name': "Contact Us"},
    {'imageicon': "assets/images/profile.png", 'name': "Our Story"},
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