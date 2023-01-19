import 'package:intl/intl.dart';

String formatData(DateTime date) {
  final formatter = DateFormat('dd/MM/yyyy');
  final formatted = formatter.format(date);
  return formatted;
}
