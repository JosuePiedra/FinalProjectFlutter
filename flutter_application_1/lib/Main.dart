import 'package:flutter/material.dart';
import 'package:flutter_application_1/apis/fromjson_cineforo.dart';
import 'package:flutter_application_1/apis/fromjson_news.dart';
import 'package:flutter_application_1/screens/cineforo_screens.dart';
import 'package:flutter_application_1/screens/noticias_screen.dart';
import 'package:get/get.dart';

void main() => runApp(const GetMaterialApp(home: HomeScreen()));
final FromJsonCineF _fromJsonCineF = FromJsonCineF();
final FromJsonNews _fromJsonNews = FromJsonNews();

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                try {
                  await _fromJsonCineF.fetchDataFromApi();
                  Get.to(CineforoScreen(dataList: _fromJsonCineF.dataList));
                } catch (e) {
                  // Aquí puedes manejar el error, si es necesario.
                  print('Error al obtener datos de la API: $e');
                }
              },
              child: const Text('Cineforo'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                await _fromJsonNews.fetchDataFromApi();
                Get.to(NoticiasScreen(dataList: _fromJsonNews.dataList));
              },
              child: const Text('Noticias'),
            ),
          ],
        ),
      ),
    );
  }
}
