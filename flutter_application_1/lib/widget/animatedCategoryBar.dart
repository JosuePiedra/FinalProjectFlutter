import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/news%20_controller.dart';
import 'package:get/get.dart';

class AnimatedCategoryBar extends StatelessWidget {
  final List<String> categories;
  final int selectedIndex;
  final Function(int) onCategorySelected;
  final NewsController newsController;
  final PageController pageController;

  AnimatedCategoryBar({
    required this.categories,
    required this.selectedIndex,
    required this.newsController,
    required this.pageController,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() => AnimatedContainer(
          duration: Duration(milliseconds: 90),
          padding: EdgeInsets.symmetric(horizontal: 16),
          color: Colors.transparent,
          height: 50,
          width: 730,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              categories.length,
              (index) => GestureDetector(
                onTap: () {
                  onCategorySelected(index);
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: index == newsController.selectedPageIndex.value
                            ? Color.fromARGB(255, 28, 69, 111)
                            : Colors.transparent,
                        width: 2.0, // Ancho de la línea
                      ),
                    ),
                  ),
                  child: Text(
                    categories[index],
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: index == newsController.selectedPageIndex.value
                          ? Color.fromARGB(255, 28, 69, 111)
                          : Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
