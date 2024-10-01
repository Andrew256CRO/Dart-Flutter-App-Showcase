import 'package:flutter/material.dart';

class Category {
  // if no color will be provided, this orange color will be used
  const Category(
      {required this.id, required this.title, this.color = Colors.orange});

  final String id;
  final String title;
  final Color color;
}
