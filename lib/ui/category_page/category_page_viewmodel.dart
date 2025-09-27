import 'package:flutter/cupertino.dart';
import 'package:jewellery_app/services/services.dart';

import '../../model/get_categories_model.dart';

class CategoryPageViewModel extends ChangeNotifier {
  late List<AllCategories> categoriesList = [];

  // Define subtopics arrays corresponding to each main topic
  final List<List<String>> subtopicsArray = [
    [
      "All",
      "New",
      "Diamond",
      "Gold",
      "Platinum",
      "Emerald",
      "Trending",
      "Recommended"
    ],
    [
      "All",
      "New",
      "Diamond",
      "Gold",
      "Platinum",
      "Emerald",
      "Trending",
      "Recommended"
    ],
    [
      "All",
      "New",
      "Diamond",
      "Gold",
      "Platinum",
      "Emerald",
      "Trending",
      "Recommended"
    ],
    [
      "All",
      "New",
      "Diamond",
      "Gold",
      "Platinum",
      "Emerald",
      "Trending",
      "Recommended"
    ],
    [
      "All",
      "New",
      "Diamond",
      "Gold",
      "Platinum",
      "Emerald",
      "Trending",
      "Recommended"
    ],
    [
      "All",
      "New",
      "Diamond",
      "Gold",
      "Platinum",
      "Emerald",
      "Trending",
      "Recommended"
    ],
    [
      "All",
      "New",
      "Diamond",
      "Gold",
      "Platinum",
      "Emerald",
      "Trending",
      "Recommended"
    ],
  ];

  bool showProgressbar = false;
  List<int?> expandedIndexesWomen = [];
  List<int?> expandedIndexesMen = [];
  List<int?> expandedIndexesUnisex = [];

  // List<int?> expandedIndexesWomen = List.generate(7, (index) => null);
  // List<int?> expandedIndexesMen = List.generate(7, (index) => null);
  // List<int?> expandedIndexesUnisex = List.generate(7, (index) => null);

  Future<void> fetchData() async {
    showProgressbar = true;
    refreshUI();
    try {
      categoriesList = await Services.getAllCategories();
      initializeExpandedIndexes(); // Initialize expandedIndexes lists
    } catch (e) {
      print('Error fetching categories: $e');
      categoriesList = []; // Set categoriesList to empty list on error
    }
    showProgressbar = false;
    notifyListeners();
  }

  void initializeExpandedIndexes() {
    int categoriesLength = categoriesList.length;
    print('categoriesLength: $categoriesLength');
    expandedIndexesWomen = List.generate(categoriesLength, (index) => null);
    expandedIndexesMen = List.generate(categoriesLength, (index) => null);
    expandedIndexesUnisex = List.generate(categoriesLength, (index) => null);
    print('expandedIndexesWomen length: ${expandedIndexesWomen.length}');
    print('expandedIndexesMen length: ${expandedIndexesMen.length}');
    print('expandedIndexesUnisex length: ${expandedIndexesUnisex.length}');
  }

  refreshUI() {
    notifyListeners();
  }

  init() {
    fetchData();
  }
}
