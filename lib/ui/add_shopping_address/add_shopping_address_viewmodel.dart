import 'package:flutter/cupertino.dart';

class AppShoppingAddressViewModel extends ChangeNotifier {

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  final formKey = GlobalKey<FormState>();




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