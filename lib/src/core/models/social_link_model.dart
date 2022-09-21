import 'package:flutter/material.dart';

class SocialLinkModel {
  SocialLinkModel({
    required this.icon,
    this.color,
    this.size = 25,
    required this.link,
  });

  final IconData icon;
  final Color? color;
  final double size;
  final String link;
}
