import 'package:flutter/material.dart';
import 'package:roshandroids/src/core/core.dart';

extension HoverExtensions on Widget {
  Widget get showCursorOnHover {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: this,
      onHover: (event) {},
      onExit: (event) {},
    );
  }

  Widget moveUpOnHover({
    bool? enableGlow,
  }) {
    return HoverAnimationWidget(
      enableGlow: enableGlow,
      child: this,
    );
  }
}
