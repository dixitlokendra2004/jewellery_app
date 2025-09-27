import 'package:flutter/cupertino.dart';

class CardEmptyViewModel extends ChangeNotifier {

  String dropdownValue = 'One';

  refreshUI() {
    notifyListeners();
  }

  init() {}

}