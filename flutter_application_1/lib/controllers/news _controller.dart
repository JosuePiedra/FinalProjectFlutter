import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewsController extends GetxController {
  var selectedPageIndex = 0.obs;
  final PageController pageController = PageController();

  void onPageChanged(int index) {
    selectedPageIndex.value = index;
  }
}
