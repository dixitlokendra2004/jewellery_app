import 'package:flutter/cupertino.dart';

class CollectionPageViewModel extends ChangeNotifier {

  // List<Map<String, dynamic>> imagearray = [
  //   {'image': "assets/collection.png"},
  //   {'image': "assets/collection.png"},
  //   {'image': "assets/collection.png"},
  //   {'image': "assets/collection.png"},
  //   {'image': "assets/collection.png"},
  // ];

 // final List<String> imagearray = List.generate(5, (index) => 'assets/images/collection.png');


  refreshUI() {
    notifyListeners();
  }

  init() {}

}