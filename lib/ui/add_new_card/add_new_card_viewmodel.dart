import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddNewCardViewModel extends ChangeNotifier {

  TextEditingController cardNameController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expMonthController = TextEditingController();
  TextEditingController expDateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  final formKey = GlobalKey<FormState>();




  int activeIndex = 0;
  final CarouselController controller = CarouselController();

  List<Map<String,dynamic>> items = [
    {
      "gradientColors": [Colors.black54, Colors.black87],
      "title": "Iris Watson",
      "subTitle": "2365 3654 2365 3698",
      "date": "03/25",
    },
    {
      "gradientColors": [Colors.pink.shade200, Colors.pink.shade400],
      "title": "Iris Watson",
      "subTitle": "2365 3654 2365 3698",
      "date": "03/25",
    },
    {
      "gradientColors": [Colors.black54, Colors.black87],
      "title": "Iris Watson",
      "subTitle": "2365 3654 2365 3698",
      "date": "03/25",
    }
  ];

  // List<Widget> buildGradientContainers() {
  //   return [
  //     gradientContainer([Colors.black54, Colors.black87]),
  //     gradientContainer([Colors.pink.shade200, Colors.pink.shade400]),
  //     gradientContainer([Colors.black54, Colors.black87]),
  //     gradientContainer([Colors.pink.shade200, Colors.pink.shade400]),
  //   ];
  // }

  activeIndexs(index) {
      activeIndex = index;
      notifyListeners();

  }



  String dropdownValue = 'One';
  int counter = 0;

  incrementCount() {
    counter++;
    notifyListeners();
  }

  decrementCount() {
    if (counter > 0) counter--;
    notifyListeners();
  }

  refreshUI() {
    notifyListeners();
  }

  init() {}

}