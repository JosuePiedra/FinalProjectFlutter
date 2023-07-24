import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/news%20_controller.dart';
import 'package:flutter_application_1/screenShapes.dart';
import 'package:flutter_application_1/widget/animatedCategoryBar.dart';
import 'package:flutter_application_1/widget/category.dart';
import 'package:flutter_application_1/screens/mainNew.dart';
import 'package:flutter_application_1/widget/newsPage.dart';
import 'package:get/get.dart';

class NoticiasScreen extends StatelessWidget {
  final List<Map<String, dynamic>> dataList;
  final NewsController _newsController = Get.put(NewsController());

  NoticiasScreen({super.key, required this.dataList});

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      AllNewsPage(dataList: dataList),
      PopularNewsPage(dataList: dataList),
      ResearchNewsPage(dataList: dataList),
    ];

    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 246, 249, 0.99),
      appBar: AppBar(
        title: const Text("Noticias", style: TextStyle(color: Colors.black)),
        backgroundColor: const Color.fromRGBO(245, 246, 249, 0.99),
        iconTheme: const IconThemeData(
          color: Color(0XAA1C466F),
        ),
        elevation: 0.1,
      ),
      body: Column(
        children: [
          SizedBox(height: ScreenUtil.screenHeight * 0.01),
          firstNew(dataList),
          SizedBox(
            height: ScreenUtil.screenHeight * 0.01,
          ),
          AnimatedCategoryBar(
            categories: ['Todas las noticias', 'Populares', 'Investigación'],
            selectedIndex: _newsController.selectedPageIndex.value,
            newsController: _newsController,
            pageController: _pageController,
            onCategorySelected: (index) {
              _newsController.selectedPageIndex.value = index;
              _pageController.animateToPage(
                index,
                duration: Duration(milliseconds: 300),
                curve: Curves.ease,
              );
            },
          ),
          Container(
            height: ScreenUtil.screenHeight * 0.38,
            child: SafeArea(
              child: PageView(
                controller: _pageController, // Usa el pageController aquí
                onPageChanged: _newsController.onPageChanged,
                children: pages, // Usa la lista de widgets creada en el paso 1
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget firstNew(List<Map<String, dynamic>> firstNew) {
    String title = firstNew.first['title'];
    String description = firstNew.first['description'];
    String image = firstNew.first['image'];
    String date = firstNew.first['date'];
    List<String> categories = firstNew.first['categories'];

    return InkWell(
      onTap: () {
        Get.to(() => mainNew(title, description, image, date, categories));
      },
      child: Container(
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: Image.network(
                image,
                fit: BoxFit.fitHeight,
                height: ScreenUtil.screenHeight * 0.43,
                width: ScreenUtil.screenWidth * 0.88,
              ),
            ),
            Container(
              height: ScreenUtil.screenHeight * 0.43,
              width: ScreenUtil.screenWidth * 0.88,
              padding: EdgeInsets.only(
                left: 25,
                right: 45,
                bottom: 0,
                top: ScreenUtil.screenHeight * 0.3,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                gradient: const LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Color.fromARGB(255, 28, 69, 120),
                    Colors.transparent,
                  ],
                ),
              ),
              child: Column(
                children: <Widget>[
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: ScreenUtil.screenHeight * 0.32,
              width: ScreenUtil.screenWidth,
              padding: EdgeInsets.only(
                left: 37,
                right: 37,
                bottom: 0,
                top: ScreenUtil.screenHeight * 0.12,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: categories.map((category) {
                    return Padding(
                      padding: const EdgeInsets.all(4),
                      child: CategoryTile(
                        categoryName: category,
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
