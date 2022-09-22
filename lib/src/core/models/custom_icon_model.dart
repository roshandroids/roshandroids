import 'package:flutter/material.dart';

class CustomIconModel {
  CustomIconModel({
    this.iconData,
    this.svgPath,
    this.imagePath,
    this.color,
    this.size = 25,
    this.link,
    this.enableShadow = true,
    this.enableBackgroundColor = true,
  }) : assert(
          iconData != null || svgPath != null || imagePath != null,
          'Either icon data or svg path or image path must be provided ',
        );

  final IconData? iconData;
  final String? svgPath;
  final String? imagePath;
  final Color? color;
  final double size;
  final String? link;
  final bool enableShadow;
  final bool enableBackgroundColor;
}
