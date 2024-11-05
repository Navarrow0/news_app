import 'package:intl/intl.dart';

class DateFormatter {
  static String format(String dateString) {
    if (dateString.isEmpty) {
      return 'Fecha no disponible';
    }
    try {
      final DateTime parsedDate = DateTime.parse(dateString);
      final String formattedDate = DateFormat('MMM dd, yyyy').format(parsedDate);
      return formattedDate;
    } catch (e) {
      return 'Fecha no disponible';
    }
  }
}
