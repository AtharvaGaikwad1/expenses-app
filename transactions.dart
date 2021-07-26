import 'package:flutter/foundation.dart';
class Transaction {
  final String id;
  String title;
  double amount;
  DateTime date;

  Transaction({
    @required this.id,
    @required this.amount,
    @required this.date,
    @required this.title,
  });
}
