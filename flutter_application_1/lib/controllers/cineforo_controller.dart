import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CineforoController extends GetxController {
  final PageController _pageController = PageController();

  final int _numPages = 4;

  final _currentPage = 0.obs;

  PageController get pageController => _pageController;

  int get numPages => _numPages;

  int get currentPage => _currentPage.value;

  void onPageChanged(int page) {
    _currentPage.value = page;
  }

  @override
  void onClose() {
    _pageController.dispose();
    super.onClose();
  }
}
