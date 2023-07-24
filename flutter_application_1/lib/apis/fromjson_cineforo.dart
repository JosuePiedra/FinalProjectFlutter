import 'package:flutter_application_1/apis/ApiConection.dart';

class FromJsonCineF {
  final ApiProvider _apiProvider = ApiProvider(
      'https://appmovil.utpl.edu.ec:8080/v2/library/benjamin/cine/forum/all?page=1');
  List<Map<String, dynamic>> dataList = [];

  Future<void> fetchDataFromApi() async {
    try {
      final Map<String, dynamic> jsonData =
          await _apiProvider.fetchDataFromApi();

      jsonData['data'].forEach((movie) {
        String title = movie['title'];
        String description = movie['description'];
        String image = movie['image']['url'];
        String release = movie['related'][0]['name'];
        String duration = movie['related'][1]['name'];

        // Agrega los datos a la lista
        dataList.add({
          'title': title,
          'description': description.replaceFirst('Sinopsis: ', ''),
          'image': image,
          'release': release,
          'duration': duration
        });
      });
    } catch (e) {
      print('Error al obtener los datos de la API: $e');
    }
  }
}
