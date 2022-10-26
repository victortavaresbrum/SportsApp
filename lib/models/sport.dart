import 'package:flutter/material.dart';

class Sport {
  const Sport({
    required this.name,
    required this.icon,
    required this.cover,
  });

  final String name;
  final IconData icon;
  final String cover;
}