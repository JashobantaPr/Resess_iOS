import 'package:intl/intl.dart';

extension DateExtension on DateTime {
  String dateFormat({String format = "dd/MM/yyyy"}) =>
      DateFormat(format).format(this);
}