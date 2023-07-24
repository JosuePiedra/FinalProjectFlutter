import 'package:flutter_application_1/apis/ApiConection.dart';

class FromJsonNews {
  final ApiProvider _apiProvider =
      ApiProvider('https://appmovil.utpl.edu.ec:8080/v1/news/all?page=1');
  List<Map<String, dynamic>> dataList = [];

  Future<void> fetchDataFromApi() async {
    try {
      final Map<String, dynamic> jsonData =
          await _apiProvider.fetchDataFromApi();

      jsonData['data'].forEach((newVariable) {
        String title = newVariable['title'];
        String description = newVariable['description'];
        String image = newVariable['image']['url'];
        String date = newVariable['date'];
        List<String> categories = [];
        for (var category in newVariable['related']) {
          categories.add(category['name']);
        }
        print("title");

        // Agrega los datos a la lista
        dataList.add({
          'title': title,
          'description': description,
          'image': image,
          'date': date,
          'categories': categories
        });
      });
    } catch (e) {
      print('Error al obtener los datos de la API: $e');
    }
  }
}
