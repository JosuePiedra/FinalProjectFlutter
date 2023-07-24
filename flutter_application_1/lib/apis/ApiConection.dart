import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiProvider {
  String urlApi;

  ApiProvider(this.urlApi);

  Future<Map<String, dynamic>> fetchDataFromApi() async {
    final apiUrl = urlApi; // No es necesario 'const' aquí
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data from API');
    }
  }
}
