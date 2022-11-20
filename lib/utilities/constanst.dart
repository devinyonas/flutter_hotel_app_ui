import 'package:intl/intl.dart';

final DateFormat dmyDateFormat = DateFormat('dd MMM yyyy');

extension MoneyExtention on num {
  String moneyFormat() {
    return '\$${floor()}';
  }
}
