import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:roshandroids/src/core/core.dart';

class CustomIconWidget extends StatelessWidget {
  const CustomIconWidget({
    super.key,
    required this.customIconModel,
  });
  final CustomIconModel customIconModel;

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
      onHover: (value) {},
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(6),
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: customIconModel.enableBackgroundColor
              ? Theme.of(context).dividerColor.withOpacity(.08)
              : null,
          boxShadow: customIconModel.enableShadow
              ? [
                  BoxShadow(
                    offset: const Offset(0, 1),
                    blurRadius: 1,
                    spreadRadius: 1,
                    color: Theme.of(context).dividerColor.withOpacity(.03),
                  ),
                ]
              : null,
        ),
        child: customIconModel.iconData != null
            ? Icon(
                customIconModel.iconData,
                size: customIconModel.size,
                color: customIconModel.color,
              )
            : customIconModel.svgPath != null
                ? SvgPicture.asset(
                    customIconModel.svgPath!,
                    height: customIconModel.size,
                    width: customIconModel.size,
                    color: customIconModel.color,
                  )
                : customIconModel.imagePath != null
                    ? Image.asset(
                        customIconModel.imagePath!,
                        height: customIconModel.size,
                        width: customIconModel.size,
                        color: customIconModel.color,
                        fit: BoxFit.contain,
                      )
                    : const SizedBox(),
      ),
    ).showCursorOnHover.moveUpOnHover(enableGlow: false);
  }
}
