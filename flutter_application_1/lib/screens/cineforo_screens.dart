import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/cineforo_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/screenShapes.dart';
import 'package:share_plus/share_plus.dart';

class CineforoScreen extends StatelessWidget {
  final List<Map<String, dynamic>> dataList;
  final CineforoController controller = Get.put(CineforoController());

  CineforoScreen({super.key, required this.dataList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cine Foro", style: TextStyle(color: Colors.black)),
        backgroundColor: const Color.fromRGBO(245, 246, 249, 0.99),
        iconTheme: const IconThemeData(
          color: Color(0XAA1C466F),
        ),
        elevation: 0.1,
      ),
      body: PageView.builder(
        controller: controller.pageController,
        itemCount: controller.numPages,
        onPageChanged: controller.onPageChanged,
        itemBuilder: (context, index) {
          Map<String, dynamic> movies = dataList[index];
          return _movieCard(movies, controller);
        },
      ),
    );
  }

  Widget _movieCard(
      Map<String, dynamic> movies, CineforoController controller) {
    String title = movies['title'];
    String synopsis = movies['description'];
    String image = movies['image'];
    String release = movies['release'];
    String duration = movies['duration'];

    return Column(
      children: [
        SizedBox(height: ScreenUtil.screenHeight * 0.01),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(
                right: 16.0), // Puedes ajustar el valor para cambiar el margen
            child: ElevatedButton(
              onPressed: () async {
                await Share.share(
                    '¡Te invito a ver esta película en el cine foro! $title');
              },
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(10),
                backgroundColor: const Color(0XAA1C466F),
              ),
              child: const Icon(Icons.share, color: Colors.white),
            ),
          ),
        ),
        SizedBox(height: ScreenUtil.screenHeight * 0.01),
        SizedBox(
          width: ScreenUtil.screenWidth * 0.9,
          height: ScreenUtil.screenHeight * 0.25,
          child: Image.network(
            image,
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(height: ScreenUtil.screenHeight * 0.04),
        SizedBox(
          width: ScreenUtil.screenWidth * 0.75,
          height: ScreenUtil.screenHeight * 0.09,
          child: Text(title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0XAA1C466F))),
        ),
        SizedBox(height: ScreenUtil.screenHeight * 0.01),
        SizedBox(
          width: ScreenUtil.screenWidth * 0.75,
          height: ScreenUtil.screenHeight * 0.17,
          child: Text(
            synopsis,
            softWrap: true,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.normal,
                color: Color(0XAA1E1E1E)),
          ),
        ),
        const Text(
          'Estreno',
          overflow: TextOverflow.clip,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: Color(0XAAE9B93F)),
        ),
        SizedBox(height: ScreenUtil.screenHeight * 0.01),
        Text(
          release,
          overflow: TextOverflow.clip,
          style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Color(0XAA757575)),
        ),
        SizedBox(height: ScreenUtil.screenHeight * 0.02),
        const Text(
          'Duración',
          overflow: TextOverflow.clip,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: Color(0XAAE9B93F)),
        ),
        SizedBox(height: ScreenUtil.screenHeight * 0.01),
        Text(
          duration,
          style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Color(0XAA757575)),
        ),
        SizedBox(height: ScreenUtil.screenHeight * 0.06),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 19.0),
          child: Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < controller.numPages; i++)
                    _buildSliderIndicator(i == controller.currentPage),
                ],
              )),
        ),
      ],
    );
  }

  Widget _buildSliderIndicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      height: isActive ? 12.0 : 8.0,
      width: isActive ? 12.0 : 8.0,
      decoration: BoxDecoration(
        color: isActive ? const Color(0XAA1C466F) : Colors.grey,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
