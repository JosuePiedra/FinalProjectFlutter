import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/Cards.dart';

class AllNewsPage extends StatelessWidget {
  final List<Map<String, dynamic>> dataList;

  AllNewsPage({required this.dataList});

  @override
  Widget build(BuildContext context) {
    return Cards(dataList: dataList);
  }
}

class PopularNewsPage extends StatelessWidget {
  final List<Map<String, dynamic>> dataList;

  PopularNewsPage({required this.dataList});

  @override
  Widget build(BuildContext context) {
    return Cards(dataList: dataList);
  }
}

class ResearchNewsPage extends StatelessWidget {
  final List<Map<String, dynamic>> dataList;
  final List<Map<String, dynamic>> dataListFinal;

  ResearchNewsPage({required this.dataList})
      : dataListFinal = dataList
            .where(
                (newItem) => newItem['categories'].contains('Investigación'))
            .toList();

  @override
  Widget build(BuildContext context) {
    // Imprime la longitud de la lista
    return Cards(dataList: dataListFinal);
  }
}
