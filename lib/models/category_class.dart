import 'package:flutter/material.dart';

class CategoryData {
  const CategoryData({
    required this.id,
    required this.title,
    this.color = Colors.green,
  });

  final String id;
  final String title;
  final Color color;
}
