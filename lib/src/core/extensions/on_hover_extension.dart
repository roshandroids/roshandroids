import 'package:roshandroids/src/core/core.dart';

extension HoverExtensions on Widget {
  Widget get showCursorOnHover {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: this,
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
