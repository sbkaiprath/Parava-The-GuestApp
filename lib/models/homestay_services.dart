import 'package:flutter/foundation.dart';

class HomestayService {
  final String id;
  final String title;
  final String description;
  final double amount;
  final String imageurl;
  HomestayService(
      {@required this.id,
      @required this.title,
      @required this.description,
      @required this.amount,
      @required this.imageurl});
}
