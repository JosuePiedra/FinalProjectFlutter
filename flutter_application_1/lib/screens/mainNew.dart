import 'package:flutter/material.dart';
import 'package:flutter_application_1/screenShapes.dart';
import 'package:flutter_application_1/widget/category.dart';
import 'package:flutter_application_1/widget/generate_link_utpl_web.dart';
import 'package:flutter_application_1/widget/get_date.dart';
import 'package:share_plus/share_plus.dart';

Widget mainNew(String title, String description, String image, String date,
    List<String> categories) {
  return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 246, 249, 0.99),
      appBar: AppBar(
        title: const Text(
          'Detalles',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(
          color: Color(0XAA1C466F),
        ),
        backgroundColor: const Color.fromRGBO(245, 246, 249, 0.99),
      ),
      body: Container(
          child: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Align(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                        Stack(children: [
                          ClipRRect(
                            child: Image.network(
                              image,
                              fit: BoxFit.fitHeight,
                              height: ScreenUtil.screenHeight * 0.4,
                              width: ScreenUtil.screenWidth,
                            ),
                          ),
                          Container(
                              height: ScreenUtil.screenHeight * 0.4,
                              width: ScreenUtil.screenWidth,
                              padding: EdgeInsets.only(
                                left: 25,
                                right: 45,
                                bottom: 0,
                                top: ScreenUtil.screenHeight * 0.3,
                              ),
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    Color.fromARGB(255, 28, 69, 120),
                                    Colors.transparent,
                                  ],
                                ),
                              )),
                          Positioned(
                            top: ScreenUtil.screenHeight * 0.01,
                            right: 5,
                            child: ElevatedButton(
                              onPressed: () async {
                                String webLinnk = generateNewsLink(title);
                                await Share.share(
                                  'Lee esta noticias que encontré $webLinnk',
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                padding: const EdgeInsets.all(10),
                                backgroundColor: Colors.transparent,
                              ),
                              child: const Icon(
                                Icons.share,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                            height: ScreenUtil.screenHeight * 0.42,
                            width: ScreenUtil.screenWidth,
                            padding: EdgeInsets.only(
                              left: 37,
                              right: 37,
                              bottom: 0,
                              top: ScreenUtil.screenHeight * 0.30,
                            ),
                            child: Text(
                              title,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ]),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: [
                                    const Icon(Icons.calendar_today),
                                    SizedBox(
                                        width: ScreenUtil.screenWidth * 0.01),
                                    Text(
                                      formatDate(date),
                                      style: const TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  '$description',
                                  textAlign: TextAlign.justify,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal,
                                    color: Color.fromARGB(255, 28, 69, 111),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          children: categories.map((category) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  left: 10,
                                  bottom: ScreenUtil.screenHeight * 0.02),
                              child: CategoryTile(
                                categoryName: category,
                              ),
                            );
                          }).toList(),
                        ),
                      ]))))));
}
