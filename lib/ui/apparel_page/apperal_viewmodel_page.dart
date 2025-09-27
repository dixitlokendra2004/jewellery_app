import 'package:flutter/cupertino.dart';

class ApparelPageViewModel extends ChangeNotifier {

  String dropdownValue = 'One';

  refreshUI() {
    notifyListeners();
  }

  init() {}

}