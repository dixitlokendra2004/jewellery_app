import 'package:flutter/cupertino.dart';

class ProductDetailViewModel extends ChangeNotifier {


  final List<String> images = List.generate(5, (index) => 'assets/images/diamond_image.png');

  PageController pageController = PageController();

  int currentPage = 0;


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