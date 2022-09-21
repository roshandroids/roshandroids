import 'package:flutter/material.dart';
import 'package:roshandroids/src/core/core.dart';

class SocialIconWidget<T> extends StatelessWidget {
  const SocialIconWidget({
    super.key,
    required this.socialLinkModel,
  });
  final SocialLinkModel socialLinkModel;

  @override
  Widget build(BuildContext context) {
    const splashColor = Colors.transparent;
    return InkWell(
      splashColor: splashColor,
      splashFactory: NoSplash.splashFactory,
      focusColor: splashColor,
      hoverColor: splashColor,
      highlightColor: splashColor,
      onTap: () {},
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(6),
        margin: const EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).dividerColor,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 1),
              blurRadius: 1,
              spreadRadius: 1,
              color: Theme.of(context).dividerColor,
            ),
          ],
        ),
        child: Icon(
          socialLinkModel.icon,
          size: socialLinkModel.size,
          color: socialLinkModel.color,
        ),
      ),
    ).showCursorOnHover.moveUpOnHover(enableGlow: false);
  }
}
