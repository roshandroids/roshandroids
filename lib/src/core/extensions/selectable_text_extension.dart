import 'package:roshandroids/src/core/core.dart';

extension SelectableTextExtension on Text {
  SelectableText get selectable => SelectableText(
        data ?? '',
        style: style,
        textAlign: textAlign,
        strutStyle: strutStyle,
        textDirection: textDirection,
        maxLines: maxLines,
        semanticsLabel: semanticsLabel,
        textWidthBasis: textWidthBasis,
        textHeightBehavior: textHeightBehavior,
      );
}
