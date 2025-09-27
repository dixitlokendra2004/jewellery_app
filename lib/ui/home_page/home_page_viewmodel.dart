import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:jewellery_app/services/services.dart';

import '../../model/image_model.dart';

class HomePageViewModel extends ChangeNotifier {

  List<AllImages> imgList = [];
  int currentPage = 0;
  late PageController pageController;
  bool showProgressbar = false;

  HomePageViewModel() {
    pageController = PageController(initialPage: currentPage); // Initialize the PageController
  }

  refreshUI() {
    notifyListeners();
  }

  init() {
    fetchData();
  }

  Future<void> fetchData() async {
    showProgressbar = true;
    refreshUI();
    imgList = await Services.getAllImages();
    showProgressbar = false;
    refreshUI();
  }
}
