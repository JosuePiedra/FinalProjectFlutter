String formatDate(String dateString) {
  DateTime dateTime = DateTime.parse(dateString);
  int day = dateTime.day;
  int month = dateTime.month;
  int year = dateTime.year;

  // Lista de meses en español
  List<String> monthsInSpanish = [
    '',
    'enero',
    'febrero',
    'marzo',
    'abril',
    'mayo',
    'junio',
    'julio',
    'agosto',
    'septiembre',
    'octubre',
    'noviembre',
    'diciembre'
  ];

  return '$day de ${monthsInSpanish[month]} de $year';
}
