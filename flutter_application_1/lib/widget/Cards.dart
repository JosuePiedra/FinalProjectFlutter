import 'package:flutter/material.dart';

import 'package:flutter_application_1/screenShapes.dart';
import 'package:flutter_application_1/screens/mainNew.dart';
import 'package:flutter_application_1/widget/category.dart';
import 'package:get/get.dart';

class Cards extends StatelessWidget {
  final List<Map<String, dynamic>> dataList;

  Cards({super.key, required this.dataList});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> newFinalDataList =
        dataList.skip(1).toList();
    return SizedBox(
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: dataList.length - 1,
        itemBuilder: (context, i) {
          Map<String, dynamic> New = newFinalDataList[i];
          return Padding(
            padding: const EdgeInsets.all(0.1),
            child: _createCard(New),
          );
        },
      ),
    );
  }

  Widget _createCard(Map<String, dynamic> New) {
    String title = New['title'];
    String image = New['image'];
    String description = New['description'];
    String date = New['date'];
    List<String> categories = New['categories'];

    return InkWell(
      onTap: () {
        Get.to(() => mainNew(title, description, image, date, categories));
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        height: ScreenUtil.screenHeight * 0.15,
        padding: EdgeInsets.symmetric(horizontal: 25),
        margin: EdgeInsets.symmetric(vertical: 5),
        child: Row(
          children: <Widget>[
            Container(
              height: ScreenUtil.screenHeight *
                  0.1, // Ajustar el tamaño de la imagen
              width: ScreenUtil.screenHeight *
                  0.1, // Ajustar el tamaño de la imagen
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Image.network(image, fit: BoxFit.cover),
              ),
            ),
            SizedBox(
              width: ScreenUtil.screenWidth * 0.03,
            ),
            Container(
              width: ScreenUtil.screenWidth * 0.63,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: categories.map((category) {
                        return Padding(
                          padding: EdgeInsets.only(
                              left: 3, bottom: ScreenUtil.screenHeight * 0.02),
                          child: CategoryTile(
                            categoryName: category,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  Text(
                    title,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.fade,
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 28, 69, 111)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
