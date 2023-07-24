import 'package:flutter/material.dart';
import 'package:flutter_application_1/screenShapes.dart';

class CategoryTile extends StatelessWidget {
  final String categoryName;

  const CategoryTile({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: ScreenUtil.screenWidth * 0.25,
          height: ScreenUtil.screenHeight * 0.025,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 233, 185, 63),
              borderRadius: BorderRadius.circular(10)),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              categoryName,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ],
    );
  }
}
