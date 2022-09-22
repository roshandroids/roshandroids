import 'package:flutter/material.dart';

class CustomIconModel {
  CustomIconModel({
    required this.name,
    this.iconData,
    this.svgPath,
    this.imagePath,
    this.color,
    this.size = 25,
    this.link,
    this.enableShadow = true,
    this.enableBackgroundColor = true,
    this.other,
  }) : assert(
          iconData != null || svgPath != null || imagePath != null,
          'Either icon data or svg path or image path must be provided ',
        );
  final String name;
  final IconData? iconData;
  final String? svgPath;
  final String? imagePath;
  final Color? color;
  final double size;
  final String? link;
  final bool enableShadow;
  final bool enableBackgroundColor;
  final Map<String, dynamic>? other;

  CustomIconModel copyWith({
    String? name,
    IconData? iconData,
    String? svgPath,
    String? imagePath,
    Color? color,
    double? size,
    String? link,
    bool? enableShadow,
    bool? enableBackgroundColor,
    Map<String, dynamic>? other,
  }) {
    return CustomIconModel(
      name: name ?? this.name,
      iconData: iconData ?? this.iconData,
      svgPath: svgPath ?? this.svgPath,
      imagePath: imagePath ?? this.imagePath,
      color: color ?? this.color,
      size: size ?? this.size,
      link: link ?? this.link,
      enableShadow: enableShadow ?? this.enableShadow,
      enableBackgroundColor:
          enableBackgroundColor ?? this.enableBackgroundColor,
      other: other ?? this.other,
    );
  }
}
